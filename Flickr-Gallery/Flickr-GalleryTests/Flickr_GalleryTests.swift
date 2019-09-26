//
//  Flickr_GalleryTests.swift
//  Flickr-GalleryTests
//
//  Created by Milan Shah on 9/25/19.
//

import Quick
import Nimble
import OHHTTPStubs
@testable import Flickr_Gallery

class PhotoFeedTest: QuickSpec {
    
    override func spec() {
        var flickrFeedViewController: PhotoFeedViewController!
        
        describe("Photo Feed View Controller Tests") {
            beforeEach {
                
                let photoFeedwireframe = PhotoFeedWireframe()
                let navigationController = UINavigationController()
                navigationController.setRootWireframe(photoFeedwireframe)
                flickrFeedViewController = photoFeedwireframe.viewController as? PhotoFeedViewController
                
                expect(flickrFeedViewController).toNot(beNil())
                flickrFeedViewController.viewDidLoad()
            }
            
            context("Photo Feed life cycle tests", {
                it("Should instantiate subviews", closure: {
                    
                    expect(flickrFeedViewController.titleLabel).toNot(beNil())
                    expect(flickrFeedViewController.searchTextField).toNot(beNil())
                    expect(flickrFeedViewController.cancelButton).toNot(beNil())
                    expect(flickrFeedViewController.collectionView).toNot(beNil())
                })
            })
            
            context("Photo Feed user actions tests", {
                
                afterEach {
                    OHHTTPStubs.removeAllStubs()
                }
                
                //Return a sample json to be able to mock the json response and pass it to presenter for Unit testing
                it("Should get Dog pictures from Flickr data", closure: {
                    stub(condition: isHost(APIConfig().getAPIHost()), response: { (_) -> OHHTTPStubsResponse in
                        return OHHTTPStubsResponse(
                            jsonObject: [:],
                            
/* TODO: Send a sample json below as a returned JSON to test modeling our data
                             
                             [
                             "photos": [
                             "page": 1,
                             "pages": 4104,
                             "perpage": 100,
                             "total": "410319",
                             "photo": [[
                             "id": "48796325001",
                             "owner": "44468771@N06",
                             "secret": "5d5931891e",
                             "server": "65535",
                             "farm": 66,
                             "title": "Light Leak in the Park",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796325001_5d5931891e_m.jpg",
                             "height_s": 162,
                             "width_s": 240
                             ], [
                             "id": "48796413867",
                             "owner": "34239398@N00",
                             "secret": "e9563382da",
                             "server": "65535",
                             "farm": 66,
                             "title": "cityscape",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796413867_e9563382da_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48796270691",
                             "owner": "34239398@N00",
                             "secret": "394d8ebbaf",
                             "server": "65535",
                             "farm": 66,
                             "title": "style",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796270691_394d8ebbaf_m.jpg",
                             "height_s": 240,
                             "width_s": 160
                             ], [
                             "id": "48795904118",
                             "owner": "35751064@N00",
                             "secret": "f91256db1f",
                             "server": "65535",
                             "farm": 66,
                             "title": "092519 . . . . . #ues #uppereastside #nyc #newyork #newyorkcity #manhattan #flowers #floral #shotoniphone #365 #tlg365",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795904118_f91256db1f_m.jpg",
                             "height_s": 240,
                             "width_s": 192
                             ], [
                             "id": "48796257586",
                             "owner": "39552449@N04",
                             "secret": "72d47a7ee7",
                             "server": "65535",
                             "farm": 66,
                             "title": "IMG_20190925_230903",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796257586_72d47a7ee7_m.jpg",
                             "height_s": 135,
                             "width_s": 240
                             ], [
                             "id": "48795902168",
                             "owner": "44468771@N06",
                             "secret": "0090d77af5",
                             "server": "65535",
                             "farm": 66,
                             "title": "Flowers",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795902168_0090d77af5_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48796257386",
                             "owner": "39552449@N04",
                             "secret": "514226ee06",
                             "server": "65535",
                             "farm": 66,
                             "title": "IMG_20190925_230857",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796257386_514226ee06_m.jpg",
                             "height_s": 135,
                             "width_s": 240
                             ], [
                             "id": "48796217661",
                             "owner": "76807015@N03",
                             "secret": "690d190e8e",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796217661_690d190e8e_m.jpg",
                             "height_s": 157,
                             "width_s": 240
                             ], [
                             "id": "48796216901",
                             "owner": "76807015@N03",
                             "secret": "0865e38305",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796216901_0865e38305_m.jpg",
                             "height_s": 156,
                             "width_s": 240
                             ], [
                             "id": "48796358262",
                             "owner": "76807015@N03",
                             "secret": "4a2542f69d",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796358262_4a2542f69d_m.jpg",
                             "height_s": 240,
                             "width_s": 167
                             ], [
                             "id": "48795860773",
                             "owner": "76807015@N03",
                             "secret": "87e327acd1",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795860773_87e327acd1_m.jpg",
                             "height_s": 240,
                             "width_s": 175
                             ], [
                             "id": "48795860223",
                             "owner": "76807015@N03",
                             "secret": "0a68d9f693",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795860223_0a68d9f693_m.jpg",
                             "height_s": 157,
                             "width_s": 240
                             ], [
                             "id": "48796356452",
                             "owner": "76807015@N03",
                             "secret": "a5d1f69390",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796356452_a5d1f69390_m.jpg",
                             "height_s": 156,
                             "width_s": 240
                             ], [
                             "id": "48795858648",
                             "owner": "76807015@N03",
                             "secret": "7215ff1f24",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795858648_7215ff1f24_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48796213066",
                             "owner": "76807015@N03",
                             "secret": "9f767fbb23",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796213066_9f767fbb23_m.jpg",
                             "height_s": 240,
                             "width_s": 179
                             ], [
                             "id": "48796354717",
                             "owner": "76807015@N03",
                             "secret": "2557311128",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796354717_2557311128_m.jpg",
                             "height_s": 240,
                             "width_s": 168
                             ], [
                             "id": "48795857128",
                             "owner": "76807015@N03",
                             "secret": "9f87f23b6c",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795857128_9f87f23b6c_m.jpg",
                             "height_s": 158,
                             "width_s": 240
                             ], [
                             "id": "48796353147",
                             "owner": "76807015@N03",
                             "secret": "556bfe4f55",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796353147_556bfe4f55_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796210356",
                             "owner": "76807015@N03",
                             "secret": "04902f3d28",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796210356_04902f3d28_m.jpg",
                             "height_s": 154,
                             "width_s": 240
                             ], [
                             "id": "48795855293",
                             "owner": "76807015@N03",
                             "secret": "b7544f6ceb",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795855293_b7544f6ceb_m.jpg",
                             "height_s": 155,
                             "width_s": 240
                             ], [
                             "id": "48795854348",
                             "owner": "76807015@N03",
                             "secret": "5b378b434f",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795854348_5b378b434f_m.jpg",
                             "height_s": 158,
                             "width_s": 240
                             ], [
                             "id": "48795853548",
                             "owner": "76807015@N03",
                             "secret": "21d2219830",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795853548_21d2219830_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796207336",
                             "owner": "76807015@N03",
                             "secret": "2be6181502",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796207336_2be6181502_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796206121",
                             "owner": "76807015@N03",
                             "secret": "881aac1ff9",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796206121_881aac1ff9_m.jpg",
                             "height_s": 151,
                             "width_s": 240
                             ], [
                             "id": "48795851013",
                             "owner": "76807015@N03",
                             "secret": "588603e0b1",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795851013_588603e0b1_m.jpg",
                             "height_s": 240,
                             "width_s": 151
                             ], [
                             "id": "48796347047",
                             "owner": "76807015@N03",
                             "secret": "b4b0116724",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796347047_b4b0116724_m.jpg",
                             "height_s": 153,
                             "width_s": 240
                             ], [
                             "id": "48795849788",
                             "owner": "76807015@N03",
                             "secret": "6325a5fa3e",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795849788_6325a5fa3e_m.jpg",
                             "height_s": 240,
                             "width_s": 158
                             ], [
                             "id": "48796203936",
                             "owner": "76807015@N03",
                             "secret": "b06259b917",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796203936_b06259b917_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796203446",
                             "owner": "76807015@N03",
                             "secret": "8ee25b0066",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796203446_8ee25b0066_m.jpg",
                             "height_s": 157,
                             "width_s": 240
                             ], [
                             "id": "48796345322",
                             "owner": "76807015@N03",
                             "secret": "a08c3a7df8",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796345322_a08c3a7df8_m.jpg",
                             "height_s": 154,
                             "width_s": 240
                             ], [
                             "id": "48796202691",
                             "owner": "76807015@N03",
                             "secret": "8dbf2d2597",
                             "server": "65535",
                             "farm": 66,
                             "title": "Fort Washington Park, 10.01.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796202691_8dbf2d2597_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796244781",
                             "owner": "34239398@N00",
                             "secret": "4219cc1033",
                             "server": "65535",
                             "farm": 66,
                             "title": "brick",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796244781_4219cc1033_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48796359052",
                             "owner": "11138397@N05",
                             "secret": "8ab538733c",
                             "server": "65535",
                             "farm": 66,
                             "title": "West 34th Street, NYC",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796359052_8ab538733c_m.jpg",
                             "height_s": 156,
                             "width_s": 240
                             ], [
                             "id": "48796267097",
                             "owner": "76807015@N03",
                             "secret": "2c6733ac20",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796267097_2c6733ac20_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796124356",
                             "owner": "76807015@N03",
                             "secret": "74ff017625",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796124356_74ff017625_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48795768533",
                             "owner": "76807015@N03",
                             "secret": "3d2622a04f",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795768533_3d2622a04f_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796263872",
                             "owner": "76807015@N03",
                             "secret": "04e42d425f",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796263872_04e42d425f_m.jpg",
                             "height_s": 156,
                             "width_s": 240
                             ], [
                             "id": "48796263357",
                             "owner": "76807015@N03",
                             "secret": "283bd37c18",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796263357_283bd37c18_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796262467",
                             "owner": "76807015@N03",
                             "secret": "61208772fb",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796262467_61208772fb_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48795765773",
                             "owner": "76807015@N03",
                             "secret": "c9800d2402",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795765773_c9800d2402_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48795764923",
                             "owner": "76807015@N03",
                             "secret": "a52e660899",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795764923_a52e660899_m.jpg",
                             "height_s": 157,
                             "width_s": 240
                             ], [
                             "id": "48795764243",
                             "owner": "76807015@N03",
                             "secret": "0506aee6fa",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795764243_0506aee6fa_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48795763508",
                             "owner": "76807015@N03",
                             "secret": "8e0fcdddf5",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795763508_8e0fcdddf5_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48795762763",
                             "owner": "76807015@N03",
                             "secret": "ca480fbba6",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795762763_ca480fbba6_m.jpg",
                             "height_s": 150,
                             "width_s": 240
                             ], [
                             "id": "48795761993",
                             "owner": "76807015@N03",
                             "secret": "898f639741",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795761993_898f639741_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796112651",
                             "owner": "76807015@N03",
                             "secret": "b9ab67a09b",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796112651_b9ab67a09b_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796253307",
                             "owner": "76807015@N03",
                             "secret": "233d111b3c",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796253307_233d111b3c_m.jpg",
                             "height_s": 240,
                             "width_s": 159
                             ], [
                             "id": "48796252047",
                             "owner": "76807015@N03",
                             "secret": "c590d02635",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796252047_c590d02635_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48796251452",
                             "owner": "76807015@N03",
                             "secret": "a10dc80d6a",
                             "server": "65535",
                             "farm": 66,
                             "title": "Central Park, 10.08.17",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796251452_a10dc80d6a_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795490278",
                             "owner": "9082025@N07",
                             "secret": "9ccdc55a41",
                             "server": "65535",
                             "farm": 66,
                             "title": "Lower East Side Corner, NYC",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795490278_9ccdc55a41_m.jpg",
                             "height_s": 184,
                             "width_s": 240
                             ], [
                             "id": "48796204692",
                             "owner": "149124832@N02",
                             "secret": "7c1c401b62",
                             "server": "65535",
                             "farm": 66,
                             "title": "I DON'T KNOW WHAT WE'RE YELLING ABOUT",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796204692_7c1c401b62_m.jpg",
                             "height_s": 240,
                             "width_s": 240
                             ], [
                             "id": "48796046771",
                             "owner": "149124832@N02",
                             "secret": "6d1a418a9a",
                             "server": "65535",
                             "farm": 66,
                             "title": "Caution: Sharp Edges",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796046771_6d1a418a9a_m.jpg",
                             "height_s": 240,
                             "width_s": 192
                             ], [
                             "id": "48796038061",
                             "owner": "56356215@N05",
                             "secret": "f72ebff2a7",
                             "server": "65535",
                             "farm": 66,
                             "title": "coffee kiosk",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796038061_f72ebff2a7_m.jpg",
                             "height_s": 240,
                             "width_s": 160
                             ], [
                             "id": "48795670938",
                             "owner": "149124832@N02",
                             "secret": "e1bb1e2af7",
                             "server": "65535",
                             "farm": 66,
                             "title": "Horsemen of the Luxe Apocalypse",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795670938_e1bb1e2af7_m.jpg",
                             "height_s": 192,
                             "width_s": 240
                             ], [
                             "id": "48796159567",
                             "owner": "149124832@N02",
                             "secret": "535255919a",
                             "server": "65535",
                             "farm": 66,
                             "title": "Seems Legit",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796159567_535255919a_m.jpg",
                             "height_s": 180,
                             "width_s": 240
                             ], [
                             "id": "48796018626",
                             "owner": "149124832@N02",
                             "secret": "a2168a8fa5",
                             "server": "65535",
                             "farm": 66,
                             "title": "Shred with the Colors of the WInd",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796018626_a2168a8fa5_m.jpg",
                             "height_s": 180,
                             "width_s": 240
                             ], [
                             "id": "48796159437",
                             "owner": "149124832@N02",
                             "secret": "2d5ac648c8",
                             "server": "65535",
                             "farm": 66,
                             "title": "Flip em the Bird",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796159437_2d5ac648c8_m.jpg",
                             "height_s": 240,
                             "width_s": 192
                             ], [
                             "id": "48796018516",
                             "owner": "149124832@N02",
                             "secret": "a509e2ddcf",
                             "server": "65535",
                             "farm": 66,
                             "title": "Police State",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796018516_a509e2ddcf_m.jpg",
                             "height_s": 180,
                             "width_s": 240
                             ], [
                             "id": "48795662313",
                             "owner": "149124832@N02",
                             "secret": "a4888ccf7d",
                             "server": "65535",
                             "farm": 66,
                             "title": "New Friend",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795662313_a4888ccf7d_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795662248",
                             "owner": "149124832@N02",
                             "secret": "6b1473e6b6",
                             "server": "65535",
                             "farm": 66,
                             "title": "Augie",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795662248_6b1473e6b6_m.jpg",
                             "height_s": 240,
                             "width_s": 192
                             ], [
                             "id": "48796018251",
                             "owner": "149124832@N02",
                             "secret": "ea27ce8e0f",
                             "server": "65535",
                             "farm": 66,
                             "title": "Augie",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796018251_ea27ce8e0f_m.jpg",
                             "height_s": 240,
                             "width_s": 192
                             ], [
                             "id": "48795661503",
                             "owner": "92057307@N05",
                             "secret": "ee908facaf",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mount Loretto #1",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795661503_ee908facaf_m.jpg",
                             "height_s": 103,
                             "width_s": 240
                             ], [
                             "id": "48796158412",
                             "owner": "92057307@N05",
                             "secret": "035a69e719",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mount Loretto #9",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796158412_035a69e719_m.jpg",
                             "height_s": 168,
                             "width_s": 240
                             ], [
                             "id": "48795661303",
                             "owner": "92057307@N05",
                             "secret": "87c266f395",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mount Loretto #2",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795661303_87c266f395_m.jpg",
                             "height_s": 108,
                             "width_s": 240
                             ], [
                             "id": "48796017266",
                             "owner": "92057307@N05",
                             "secret": "34b065ccbf",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mount Loretto #3",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796017266_34b065ccbf_m.jpg",
                             "height_s": 154,
                             "width_s": 240
                             ], [
                             "id": "48795661103",
                             "owner": "92057307@N05",
                             "secret": "0dd479c568",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mount Loretto #4",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795661103_0dd479c568_m.jpg",
                             "height_s": 89,
                             "width_s": 240
                             ], [
                             "id": "48796158137",
                             "owner": "92057307@N05",
                             "secret": "43a55c5cb7",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mount Loretto #5",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796158137_43a55c5cb7_m.jpg",
                             "height_s": 104,
                             "width_s": 240
                             ], [
                             "id": "48796016946",
                             "owner": "92057307@N05",
                             "secret": "b3c21fca69",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mount Loretto #7",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796016946_b3c21fca69_m.jpg",
                             "height_s": 165,
                             "width_s": 240
                             ], [
                             "id": "48795660613",
                             "owner": "92057307@N05",
                             "secret": "1f66ddcb68",
                             "server": "65535",
                             "farm": 66,
                             "title": "Nightscape #2",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795660613_1f66ddcb68_m.jpg",
                             "height_s": 144,
                             "width_s": 240
                             ], [
                             "id": "48796157642",
                             "owner": "92057307@N05",
                             "secret": "8e1b30b2eb",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mount Loretto #8",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796157642_8e1b30b2eb_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795660143",
                             "owner": "92057307@N05",
                             "secret": "afa8918bac",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mount Loretto #10",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795660143_afa8918bac_m.jpg",
                             "height_s": 145,
                             "width_s": 240
                             ], [
                             "id": "48795659983",
                             "owner": "92057307@N05",
                             "secret": "ed8ed34e5a",
                             "server": "65535",
                             "farm": 66,
                             "title": "Nightscape #1",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795659983_ed8ed34e5a_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48795659508",
                             "owner": "92057307@N05",
                             "secret": "c8e8a4dcea",
                             "server": "65535",
                             "farm": 66,
                             "title": "Nightscape #4",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795659508_c8e8a4dcea_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795659368",
                             "owner": "92057307@N05",
                             "secret": "1e9228f253",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mount Loretto #6",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795659368_1e9228f253_m.jpg",
                             "height_s": 141,
                             "width_s": 240
                             ], [
                             "id": "48795659273",
                             "owner": "92057307@N05",
                             "secret": "b331b8e61f",
                             "server": "65535",
                             "farm": 66,
                             "title": "Nightscape #3",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795659273_b331b8e61f_m.jpg",
                             "height_s": 157,
                             "width_s": 240
                             ], [
                             "id": "48796069837",
                             "owner": "158490068@N02",
                             "secret": "712f4af05c",
                             "server": "65535",
                             "farm": 66,
                             "title": "The Dakota",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48796069837_712f4af05c_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795861921",
                             "owner": "39381325@N05",
                             "secret": "37119f348d",
                             "server": "65535",
                             "farm": 66,
                             "title": "Air India Boeing 777-300 VT-ALS",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795861921_37119f348d_m.jpg",
                             "height_s": 120,
                             "width_s": 240
                             ], [
                             "id": "48795899777",
                             "owner": "139066376@N03",
                             "secret": "e86e221501",
                             "server": "65535",
                             "farm": 66,
                             "title": "El Toro Taqueria",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795899777_e86e221501_m.jpg",
                             "height_s": 180,
                             "width_s": 240
                             ], [
                             "id": "48795370538",
                             "owner": "58080450@N06",
                             "secret": "8b4a7f7b17",
                             "server": "65535",
                             "farm": 66,
                             "title": "DIDX1913----1-400 s \u00e0 f - 1,0--ISO 3200",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795370538_8b4a7f7b17_m.jpg",
                             "height_s": 180,
                             "width_s": 240
                             ], [
                             "id": "48795717731",
                             "owner": "59273598@N04",
                             "secret": "79765eb7e5",
                             "server": "65535",
                             "farm": 66,
                             "title": "I n v i e r n o",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795717731_79765eb7e5_m.jpg",
                             "height_s": 138,
                             "width_s": 240
                             ], [
                             "id": "48795707376",
                             "owner": "47660775@N03",
                             "secret": "5067c0e16a",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mayor Bill de Blasio hosts a roundtable for ethnic and community broadcast media.",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795707376_5067c0e16a_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795349413",
                             "owner": "47660775@N03",
                             "secret": "a8a0db4758",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mayor Bill de Blasio hosts a roundtable for ethnic and community broadcast media.",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795349413_a8a0db4758_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795349358",
                             "owner": "47660775@N03",
                             "secret": "1260f27d9c",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mayor Bill de Blasio hosts a roundtable for ethnic and community broadcast media.",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795349358_1260f27d9c_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795707216",
                             "owner": "47660775@N03",
                             "secret": "ab807ba13e",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mayor Bill de Blasio hosts a roundtable for ethnic and community broadcast media.",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795707216_ab807ba13e_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795349278",
                             "owner": "47660775@N03",
                             "secret": "0d7ed061c9",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mayor Bill de Blasio hosts a roundtable for ethnic and community broadcast media.",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795349278_0d7ed061c9_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795846207",
                             "owner": "47660775@N03",
                             "secret": "dc824e000b",
                             "server": "65535",
                             "farm": 66,
                             "title": "Mayor Bill de Blasio hosts a roundtable for ethnic and community broadcast media.",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795846207_dc824e000b_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795704721",
                             "owner": "61298119@N03",
                             "secret": "c501f57a20",
                             "server": "65535",
                             "farm": 66,
                             "title": "Cohan and Duffy",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795704721_c501f57a20_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795333613",
                             "owner": "182496676@N03",
                             "secret": "6c6c53c4d0",
                             "server": "65535",
                             "farm": 66,
                             "title": "DSC_0006",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795333613_6c6c53c4d0_m.jpg",
                             "height_s": 164,
                             "width_s": 240
                             ], [
                             "id": "48795690331",
                             "owner": "39586421@N00",
                             "secret": "e949412f42",
                             "server": "65535",
                             "farm": 66,
                             "title": "Ugolino",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795690331_e949412f42_m.jpg",
                             "height_s": 164,
                             "width_s": 240
                             ], [
                             "id": "48795301758",
                             "owner": "64758833@N04",
                             "secret": "1564238452",
                             "server": "65535",
                             "farm": 66,
                             "title": "Too many Arab Wars - Thanks OBL",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795301758_1564238452_m.jpg",
                             "height_s": 240,
                             "width_s": 240
                             ], [
                             "id": "48795297688",
                             "owner": "16251496@N00",
                             "secret": "87769b11cd",
                             "server": "65535",
                             "farm": 66,
                             "title": "End of Summer",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795297688_87769b11cd_m.jpg",
                             "height_s": 164,
                             "width_s": 240
                             ], [
                             "id": "48795634316",
                             "owner": "33818879@N05",
                             "secret": "b4445a5287",
                             "server": "65535",
                             "farm": 66,
                             "title": "Brooklyn Bride, septembre 2018",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795634316_b4445a5287_m.jpg",
                             "height_s": 240,
                             "width_s": 159
                             ], [
                             "id": "48795767252",
                             "owner": "33818879@N05",
                             "secret": "bd5eac4fc2",
                             "server": "65535",
                             "farm": 66,
                             "title": "New York City, septembre 2018",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795767252_bd5eac4fc2_m.jpg",
                             "height_s": 240,
                             "width_s": 159
                             ], [
                             "id": "48795244883",
                             "owner": "33818879@N05",
                             "secret": "199b98483c",
                             "server": "65535",
                             "farm": 66,
                             "title": "Brooklyn Bridge, New York, septembre 2018",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795244883_199b98483c_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48795731717",
                             "owner": "33818879@N05",
                             "secret": "113107b8e2",
                             "server": "65535",
                             "farm": 66,
                             "title": "New York City, septembre 2018",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795731717_113107b8e2_m.jpg",
                             "height_s": 159,
                             "width_s": 240
                             ], [
                             "id": "48795223958",
                             "owner": "33818879@N05",
                             "secret": "bbab9cb2a8",
                             "server": "65535",
                             "farm": 66,
                             "title": "New York city, septembre 2018",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795223958_bbab9cb2a8_m.jpg",
                             "height_s": 240,
                             "width_s": 159
                             ], [
                             "id": "48795580596",
                             "owner": "33818879@N05",
                             "secret": "2e7e33f3c5",
                             "server": "65535",
                             "farm": 66,
                             "title": "New York City, septembre 2018",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795580596_2e7e33f3c5_m.jpg",
                             "height_s": 240,
                             "width_s": 159
                             ], [
                             "id": "48795557041",
                             "owner": "128170512@N05",
                             "secret": "cb533c85bb",
                             "server": "65535",
                             "farm": 66,
                             "title": "eye of the beholder",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795557041_cb533c85bb_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795465896",
                             "owner": "55122328@N00",
                             "secret": "9e24e4ef22",
                             "server": "65535",
                             "farm": 66,
                             "title": "816",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795465896_9e24e4ef22_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ], [
                             "id": "48795603927",
                             "owner": "55122328@N00",
                             "secret": "472b0c8e4b",
                             "server": "65535",
                             "farm": 66,
                             "title": "813",
                             "ispublic": 1,
                             "isfriend": 0,
                             "isfamily": 0,
                             "url_s": "https:\/\/live.staticflickr.com\/65535\/48795603927_472b0c8e4b_m.jpg",
                             "height_s": 160,
                             "width_s": 240
                             ]]
                             ],
                             "stat": "ok"
                             ]
                             
                             */
        
                            statusCode: 200,
                            headers: [:]
                        )
                    })
                    
                    flickrFeedViewController.searchTextField.text = "Dog"
                    flickrFeedViewController.presenter.fetchPhotos(for: flickrFeedViewController.searchTextField.text ?? "", pageNumber: 1)
                })
                
            })
            
            // TODO: Check if Photo Feed collectionview is not empty and queryResult.count matches to the collectionview items count
            context("Photo Feed should show results based on query search", {
                it("Query results should show in collection view", closure: {
                    expect(flickrFeedViewController.queryResult).toNot(beEmpty())
                })
            })
        }
    }
}
