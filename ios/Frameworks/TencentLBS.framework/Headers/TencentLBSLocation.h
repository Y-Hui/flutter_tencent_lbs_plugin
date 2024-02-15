//
//  TencentLBSLocation.h
//  TencentLBS
//
//  Created by mirantslu on 16/4/19.
//  Copyright © 2016年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

#define TENCENTLBS_DEBUG 0

typedef NS_ENUM(NSInteger, TencentLBSDRProvider) {
    TencentLBSDRProviderError      = -2,       //!< 错误，可能未开启 dr
    TencentLBSDRProviderUnkown     = -1,       //!< 定位结果来源未知
    TencentLBSDRProviderFusion     = 0,        //!< 定位结果来源融合的结果
    TencentLBSDRProviderGPS        = 1,        //!< 定位结果来源 GPS
    TencentLBSDRProviderNetWork    = 2,        //!< 定位结果来源网络
};

typedef NS_OPTIONS(NSUInteger, TencentLBSLocationFake) {
    TencentLBSLocationFakeOK                    = 0,        //!< 正常
    TencentLBSLocationFakeCoordinate            = 1 << 0,   //!< 坐标是否被 hook 校验
    TencentLBSLocationFakeSpeed                 = 1 << 1,   //!< 速度合法性校验
    TencentLBSLocationFakeCrc                   = 1 << 2,   //!< 循环冗余校验
    TencentLBSLocationFakeMotion                = 1 << 3,   //!< 运动状态和定位点校验
    TencentLBSLocationFakeMotionData            = 1 << 4,   //!< 传感器数据校验
    TencentLBSLocationFakeMotionType            = 1 << 5,   //!< 系统的运动状态和传感器识别的运动状态校验
    TencentLBSLocationFakeFirstCallbackSpeed    = 1 << 6,   //!< 系统首次定位回调速度校验
    TencentLBSLocationFakeSimulation            = 1 << 7,   //!< 模拟位置校验
    TencentLBSLocationFakeLocationAge           = 1 << 8,   //!< 系统当前时间与 Location  的时间校验
    TencentLBSLocationFakeLocationSame          = 1 << 9,   //!< 系统一直回调同一个点校验
};

typedef NS_ENUM(NSInteger, TencentLBSLocationProvider) {
    TencentLBSLocationProviderUnkown            = -1,       //!< 普适定位结果来源未知
    TencentLBSLocationProviderGPS               = 0,        //!< 普适定位结果来源手机的 GPS
    TencentLBSLocationProviderNetWork           = 1,        //!< 普适定位结果来源手机的 Network
    TencentLBSLocationProviderSimulated         = 2,        //!< 普适定位结果来源模拟定位
    TencentLBSLocationProviderAccessoryGPS      = 3,        //!< 普适定位结果来源外设的 GPS
    TencentLBSLocationProviderAccessoryNetwork  = 4,        //!< 普适定位结果来源外设的 Network
};

@interface TencentLBSPoi : NSObject<NSSecureCoding, NSCopying>

@property (nonatomic, copy) NSString *uid;       //!< 当前POI的uid
@property (nonatomic, copy) NSString *name;      //!< 当前POI的名称
@property (nonatomic, copy) NSString *address;   //!< 当前POI的地址
@property (nonatomic, copy) NSString *catalog;   //!< 当前POI的类别
@property (nonatomic, assign) double longitude;  //!< 当前POI的经度
@property (nonatomic, assign) double latitude;   //!< 当前POI的纬度
@property (nonatomic, assign) double distance;   //!< 当前POI与当前位置的距离

@end

@interface TencentLBSLocation : NSObject<NSSecureCoding, NSCopying>

/**
 *  返回当前位置的CLLocation信息
 */
@property (nonatomic, strong) CLLocation *location;

/**
 *  返回当前位置的行政区划, 0-表示中国大陆、港、澳, 1-表示其他
 */
@property (nonatomic, assign) NSInteger areaStat;

/**
 *  返回当前位置的作弊码
 */
@property (nonatomic, assign) TencentLBSLocationFake fakeCode;

/**
 * 返回室内定位楼宇Id
 */
@property (nonatomic, copy, nullable) NSString *buildingId;

/**
 * 返回室内定位楼层
 */
@property (nonatomic, copy, nullable) NSString *buildingFloor;

/**
 * 返回室内定位类型，0表示普通定位结果，1表示蓝牙室内定位结果
 */
@property (nonatomic, assign) NSInteger indoorLocationType;

/**
 * 
 */
@property (nonatomic, assign) TencentLBSDRProvider drProvider;

/**
 *  普适定位结果来源
 */
@property (nonatomic, assign) TencentLBSLocationProvider locationProvider;

/**
 *  返回当前位置的名称，
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelName或TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *name;

/**
 *  返回当前位置的地址
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelName或TencentLBSRequestLevelAdminName有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *address;

/**
 *  返回国家编码，例如中国为156
 *  <b>注意：该接口涉及到WebService API，请参考https://lbs.qq.com/service/webService/webServiceGuide/webServiceOverview中的配额限制说明，
 *  并将申请的有效key通过TencentLBSLocationManager的- (void)setDataWithValue: forKey:方法设置，其中key为固定值@"ReGeoCodingnKey"，例如[tencentLocationManager setDataWithValue:@"您申请的key（务必正确）" forKey:@"ReGeoCodingnKey"];，否则将返回默认值0</b>
 */
@property (nonatomic, assign) NSInteger nationCode;

/**
 *  返回当前位置的城市编码
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *code;

/**
 *  返回当前位置的国家
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *nation;

/**
 *  返回当前位置的省份
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *province;

/**
 *  返回当前位置的城市固话编码.
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *cityPhoneCode;

/**
 *  返回当前位置的城市
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *city;

/**
 *  返回当前位置的区县
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *district;

/**
 *  返回当前位置的乡镇
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *town;

/**
 *  返回当前位置的村
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *village;

/**
 *  返回当前位置的街道
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *street;

/**
 *  返回当前位置的街道编码
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelAdminName或TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, copy, nullable) NSString *street_no;

/**
 *  返回当前位置周围的POI
 *  仅当TencentLBSRequestLevel为TencentLBSRequestLevelPoi有返回值，否则为空
 */
@property (nonatomic, strong, nullable) NSArray<TencentLBSPoi*> *poiList;

/**
 *  返回两个位置之间的横向距离
 *  @param location
 */
- (double)distanceFromLocation:(const TencentLBSLocation *)location;

// 测试使用
#if TENCENTLBS_DEBUG
@property (nonatomic, copy, nullable) NSString *halleyTime;
#endif

@end

NS_ASSUME_NONNULL_END
