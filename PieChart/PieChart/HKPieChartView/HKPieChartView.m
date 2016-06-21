//
//  HKPieChartView.m
//  PieChart
//
//  Created by hukaiyin on 16/6/20.
//  Copyright © 2016年 HKY. All rights reserved.
//

#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式

#import "HKPieChartView.h"

@interface HKPieChartView()

@property (nonatomic, strong) CAShapeLayer *trackLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, assign) UIColor *trackColor;
@property (nonatomic, assign) UIColor *progressColor;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIBezierPath *path;
@end

@implementation HKPieChartView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self experiment];
    }
    return self;
}

- (void)experiment {
    self.trackColor = [UIColor blackColor];
    self.progressColor = [UIColor greenColor];
    [self trackLayer];
    [self gradientLayer];
}

#pragma mark - Load

- (void)loadLayer:(CAShapeLayer *)layer WithColor:(UIColor *)color {
    layer.frame = self.bounds;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = color.CGColor;
    layer.lineCap = kCALineCapSquare;
    layer.lineWidth = self.lineWidth;
    layer.path = self.path.CGPath;
}

#pragma mark - Getters & Setters

- (CAShapeLayer *)trackLayer {
    if (!_trackLayer) {
        _trackLayer = [CAShapeLayer layer];
        [self loadLayer:_trackLayer WithColor:self.trackColor];
        _trackLayer.opacity = 0.1;
        
        [self.layer addSublayer:_trackLayer];
    }
    return _trackLayer;
}

- (CAShapeLayer *)progressLayer {
    if (!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        [self loadLayer:_progressLayer WithColor:self.progressColor];
        _progressLayer.strokeEnd = 0;
    }
    return _progressLayer;
}

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        _gradientLayer.colors = @[(id)[UIColor cyanColor].CGColor,
                                 (id)[UIColor blueColor].CGColor];
        [_gradientLayer setStartPoint:CGPointMake(0.5, 1.0)];
        [_gradientLayer setEndPoint:CGPointMake(0.5, 0.0)];
        
        [_gradientLayer setMask:self.progressLayer];
        [self.layer addSublayer:_gradientLayer];
    }
    return _gradientLayer;
}

- (UIBezierPath *)path {
    if (!_path) {
        CGFloat halfWidth = self.bounds.size.width / 2;
        _path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(halfWidth, halfWidth)
                                               radius:(self.bounds.size.width - self.lineWidth)/2
                                           startAngle:-M_PI/2*3
                                             endAngle:M_PI/2
                                            clockwise:YES];
    }
    return _path;
}

- (CGFloat)lineWidth {
    if (_lineWidth == 0) {
        _lineWidth = 4;
    }
    return _lineWidth;
}

- (void)setPercent:(CGFloat)percent {
    
    _percent = percent;
    _percent = _percent > 100 ? 100 : _percent;
    _percent = _percent < 0 ? 0 : _percent;
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:1];
    
    self.progressLayer.strokeEnd = percent/100.0;

    [CATransaction commit];
}

@end
