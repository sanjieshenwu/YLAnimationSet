//
//  AppStoreHomeVC.m
//  YLAnimationSet
//
//  Created by zyl on 2019/3/2.
//  Copyright © 2019 zyl. All rights reserved.
//

#import "AppStoreHomeVC.h"
#import "YLConst.h"
#import "HomeCell.h"
#import "AppModel.h"
#import "AppDetailVC.h"

@interface AppStoreHomeVC ()<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIViewControllerAnimatedTransitioning>
{
    NSIndexPath *selectIndexPath;
}

/** 数据 */
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation AppStoreHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    AppModel *model1 = [[AppModel alloc] init];
    model1.title = @"哈弗H6Coupe震撼上市";
    model1.subTitle = @"体验“中国芯”动力新哈弗H6 Coupe";
    model1.content = @"前卫设计动感十足 体验“中国芯”动力新哈弗H6 Coupe\n新哈弗H6 Coupe是长城公司采用全新设计语言开发的一款具有酷颜值，酷动力，酷装备的SUV。此次新哈弗H6 Coupe由内而外的全面升级，必将引来大众的追捧，开创哈弗SUV新篇章...\n1.5GDIT发动机应用CVVL、缸内直喷等前沿技术，动力响应快、燃油经济性好，最大功率124kW，1400转爆发最大扭矩285N·m，百公里加速9.7s，百公里油耗仅6.8L，荣获“中国心”2017十佳发动机；\n7DCT湿式双离合变速器采用最先进的摩擦材料，速比范围高达8.0，换挡平顺、可靠性高，提升燃油经济性,荣获2018届世界十佳变速器。\n整车采用超刚性一体式安全结构车身；\n配备奥托立夫6安全气囊、帘式气囊贯穿前后，保护面积更宽泛；\n盲点侦测，保证行车安全；\n配备360环视影像系统、LED组合前灯，驾乘更安全。\n外观采用钻石形体光学设计，车身线条硬朗连贯，更动感；\n内饰采用大面贯穿式整体设计，断面式仪表板极具立体感，打造科技及尊享兼备的体验。";
    model1.imageName = @"Home_demo_01";
    
    AppModel *model2 = [[AppModel alloc] init];
    model2.title = @"黑天鹅蛋糕";
    model2.subTitle = @"“我的一生，为美而感动，为美而存在”";
    model2.content = @"一兆韦德健身管理有限公司目前有员工3000多人，拥有超过一百家健身会所。公司大力倡导绿色环保和时尚健身运动。凭借先进的管理理念、丰富的行业经验、完善的管理体系和管理团队，业已成为业内发展速度快、分店数量多、会员数量众多的健身连锁机构。公司多次通过权威机构认证，目前由国际著名投资公司——新加坡淡马锡集团注资，2015年更是获得了上海市著名商标，是健身行业内首个获得该荣誉的企业。公司希望通过全体员工的努力为社会提供有价值的健康生活服务，成为具世界竞争力的连锁健身企业之一。公司将打造更多的绿色生态会馆、为美好的城市生活贡献更多力量。";
    model2.imageName = @"Home_demo_02";
    
    AppModel *model3 = [[AppModel alloc] init];
    model3.title = @"高端健身会所入驻园区";
    model3.subTitle = @"让运动助力工作生活";
    model3.content = @"黑天鹅 \n隶属于北京黑天鹅餐饮管理有限公司，公司主要打造国内品质卓越，美味安心的蛋糕。黑天鹅蛋糕源于黄金比例的配方，精选世界各地优质食材，让您和朋友轻松享受精品蛋糕。\n用新锐的艺术理念和国际化的视野，带领团队重塑品牌，开启了黑天鹅与全球顶尖的甜品大师、设计大师和顶级原料商全面合作的阶段，让黑天鹅的产品和形象获得蜕变和飞跃，迅速跻身于国际一流烘焙品牌的行列。\n黑天鹅蛋糕推出以来，一直以一种“昂贵、奢华、精美”的形象示人，北京的首家实体店铺，自然要延续这个风格。先站在门口拍一张，这种风格的铺面，在蛋糕店里绝对令人耳目一新。";
    model3.imageName = @"Home_demo_03";
    [self.dataSource addObjectsFromArray:@[model1, model2, model3]];
    [self.tableView reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
    // 隐藏状态栏
    [UIView animateWithDuration:0.2 animations:^{
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        self.navigationController.navigationBarHidden = NO;
    }];
}

#pragma mark - Table view datasource and delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (kScreenWidth - 40) * 1.3 + 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.shouldGroupAccessibilityChildren = YES;
    }
    AppModel *model = self.dataSource[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.contentLabel.text = model.subTitle;
    cell.bgImageView.image = [UIImage imageNamed:model.imageName];
    cell.transform = CGAffineTransformMakeScale(1, 1);
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectIndexPath = indexPath;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.2 animations:^{
        cell.transform = CGAffineTransformMakeScale(0.9, 0.9);
    }];
    return YES;
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([selectIndexPath isEqual:indexPath]) {
        [UIView animateWithDuration:0.2 animations:^{
            cell.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HomeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.transform = CGAffineTransformMakeScale(0.9, 0.9);
    AppDetailVC *detail = [[AppDetailVC alloc]init];
    detail.selectIndexPath = indexPath;
    AppModel *model = self.dataSource[indexPath.row];
    // 截屏
    detail.bgImage = [self imageFromView];
    detail.titles = model.title;
    detail.titleTwo = model.subTitle;
    detail.content = model.content;
    detail.imageName = model.imageName;
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - 截屏

- (UIImage *)imageFromView {
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    HomeCell *cell = (HomeCell *)[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = nil;
    @try {
        toView = [toVC valueForKeyPath:@"headerImageView"];
    } @catch (NSException *exception) {
        UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        AppStoreHomeVC *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIView *containerView = [transitionContext containerView];
        [containerView insertSubview:toVC.view belowSubview:fromVC.view];
        [UIView transitionFromView:fromVC.view toView:toVC.view duration:[self transitionDuration:transitionContext] options:UIViewAnimationOptionCurveLinear completion:^(BOOL finished) {
            [containerView layoutIfNeeded];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        return;
    } @finally {
        
    }
    
    UIView *fromView = cell.bgView;
    UIView *containerView = [transitionContext containerView];
    UIView *snapShotView = [[UIImageView alloc]initWithImage:cell.bgImageView.image];
    snapShotView.frame = [containerView convertRect:fromView.frame fromView:fromView.superview];
    
    fromView.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toView.alpha = 0;
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, kScreenWidth-30, 30)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = [UIFont systemFontOfSize:25];
    titleLabel.text = cell.titleLabel.text;
    
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, (kScreenWidth-40)*1.3-30, kScreenWidth-44, 15)];
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.textColor = [UIColor whiteColor];
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.alpha = 0.5;
    contentLabel.text =cell.contentLabel.text;
    [snapShotView addSubview:titleLabel];
    [snapShotView addSubview:contentLabel];
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapShotView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
        [containerView layoutIfNeeded];
        toVC.view.alpha = 1.0f;
        toView.alpha = 1.0f;
        snapShotView.frame = [containerView convertRect:toView.frame fromView:toView.superview];
        titleLabel.frame = CGRectMake(22, 30, kScreenWidth-30, 30);
        contentLabel.frame = CGRectMake(22, kScreenWidth*1.3-30, kScreenWidth*1.3-44, 15);
        
    } completion:^(BOOL finished) {
        
        fromView.hidden = NO;
        [snapShotView removeFromSuperview];
        [self.tableView reloadData];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}


@end
