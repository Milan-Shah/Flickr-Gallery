//
//  PhotoFeedViewController.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import UIKit
import SnapKit
import MKProgress

final class PhotoFeedViewController: UIViewController {
    
    // MARK: - Public properties -
    var presenter: PhotoFeedPresenterInterface!
    var searchTextField: UITextField!
    var searchCancelButton: UIButton!
    var collectionView: UICollectionView!
    var titleLabel: UILabel!
    var cancelButton: UIButton!
    var paginationNumber = 1
    var queryResult: [Photo] = []
    var errorLabel: UILabel!
    var searchQueryText = ""
    
    // MARK: - Lifecycle -
    
    let photoCellIdentifier = "photoCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitleLabel()
        addSearchUI()
        addCollectionView()
    }
    
    func addTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Browse"
        titleLabel.font = .museoSans(.ms700, size: 30.0)
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(75)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
    }
    
    func addSearchUI() {
        searchTextField = UITextField().searchTextField()
        searchTextField.delegate = self
        
        let attributedSearchText = NSAttributedString().attributedText(text: "Search...", font: .museoSans(.ms300, size: 14.0), textColor: .lightGray)
        searchTextField.attributedPlaceholder = attributedSearchText
        searchTextField.returnKeyType = .search
        view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.height.equalTo(35)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
        }
        
        cancelButton = UIButton(type: .custom)
        let attributedCancelTitle = NSAttributedString().attributedText(text: "Cancel", font: .museoSans(.ms300, size: 14.0), textColor: .lightGray)
        cancelButton.setAttributedTitle(attributedCancelTitle, for: .normal)
        cancelButton.setTitleColor(.lightGray, for: .normal)
        cancelButton.addTarget(self, action: #selector(resignFirstResponderForSearch), for: .touchUpInside)
        view.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.height.equalTo(searchTextField.snp.height)
            make.width.equalTo(100)
            make.leading.equalTo(searchTextField.snp.trailing).offset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        errorLabel = UILabel()
        let attributedErrorText = NSAttributedString().attributedText(text: "We were unable to find query matching photos. \n\nTry something else instead.", font: .museoSans(.ms500, size: 14.0), textColor: .lightGray)
        errorLabel.attributedText = attributedErrorText
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.alpha = 0
        view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(searchTextField.snp.bottom).offset(75)
            make.leading.equalToSuperview().offset(75)
            make.trailing.equalToSuperview().inset(75)
        }
    }
    
    @objc
    func resignFirstResponderForSearch() {
        searchTextField.resignFirstResponder()
        queryResult = []
        collectionView.reloadData()
    }
    
    func updateSearchTextFieldConstrains(hideCancelButton: Bool) {
        
        if hideCancelButton {
            searchTextField.snp.updateConstraints { (update) in
                update.trailing.equalTo(titleLabel)
            }
        } else {
            searchTextField.snp.updateConstraints { (update) in
                update.trailing.equalTo(titleLabel).inset(100)
            }
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    func animateErrorLabel(show: Bool) {
        
        var alpha = CGFloat(0)
        if show {
            alpha = 1
        }
        UIView.animate(withDuration: 0.5) {
            self.errorLabel.alpha = alpha
        }
    }
    
    func addCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.prefetchDataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: photoCellIdentifier)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(searchTextField.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalTo(titleLabel)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

// MARK: - Extensions -

extension PhotoFeedViewController: PhotoFeedViewInterface, UITextFieldDelegate {
    
    func fetchedPhotosSuccessfully(_ result: Photos) {
        paginationNumber = result.photos.page
        if queryResult.count == 0 {
            animateErrorLabel(show: true)
        }
        
        if paginationNumber > 1 {
            // Append each one
            for each in result.photos.photo {
                queryResult.append(each)
            }
        } else {
            queryResult = []
            queryResult = result.photos.photo
            collectionView.scrollsToTop = true
        }
        
        collectionView.reloadData()
    }
    
    func showFailureError() {
        animateErrorLabel(show: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateSearchTextFieldConstrains(hideCancelButton: false)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text?.count ?? 0 < 1 && string.first == " " { // Not allowing first character to be a space character
            return false
        }
        
        if let textFieldText = textField.text, textFieldText.count > 1 {
            searchQueryText = textFieldText + string
            animateErrorLabel(show: false)
            self.presenter.fetchPhotos(for: searchQueryText, pageNumber: paginationNumber) // To do for more page #
        } else {
            queryResult = []
            collectionView.reloadData()
        }
        
        collectionView.scrollsToTop = true
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSearchTextFieldConstrains(hideCancelButton: true)
    }
    
}

extension PhotoFeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return queryResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellIdentifier, for: indexPath) as! PhotoCell
        let photoObject = queryResult[indexPath.row]
        cell.backgroundColor = .white
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.masksToBounds = true
        
        if let photoURLString = photoObject.url_s {
            self.presenter.fetchImage(photoURLString, for: cell.imageView)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let photoObject = queryResult[indexPath.row]
        let collectionViewWidth = collectionView.frame.size.width
        guard let heightForPhoto = photoObject.height_s else {
            return CGSize(width: collectionViewWidth, height: 160) // Default height is 160
        }
        
        return CGSize(width: collectionViewWidth, height: CGFloat(heightForPhoto))
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if indexPath.row >= queryResult.count - 25 { // whenever we reach last 25 items within collectionview, we will fetch new data
                self.presenter.fetchPhotos(for: searchQueryText, pageNumber: paginationNumber + 1)
            }
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= queryResult.count
    }
    
}

class PhotoCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleAspectFill
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

