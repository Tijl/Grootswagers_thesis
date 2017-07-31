%% make 3d hyperplane
rng(10)
sep = .25;
n=500;s=.25;
class0 = s*randn(n,3)-sep;
class1 = s*randn(n,3)+sep;

f=figure(1);clf;
set(f,'Position',[100,10,435,425],'PaperPositionMode','auto')
a=axes();set(a,'Units','Pixels','Position',[25 15 400 400],'FontSize',16,'box','off');hold on

a.LineWidth=2;
s1=plot3(class0(:,1),class0(:,2),class0(:,3),'s');
s2=plot3(class1(:,1),class1(:,2),class1(:,3),'o');

c1 = a.ColorOrder(2,:);%c1=[1 0 0]
c2 = a.ColorOrder(1,:);%c2=[0 0 1]
c3 = a.ColorOrder(1,:);c3=[.5 .5 .5]

set(s1,'Color',.75*c1,'MarkerFaceColor',c1);
set(s2,'Color',.75*c2,'MarkerFaceColor',c2);
set([s1 s2],'MarkerSize',7);
lims = [-1.25 1.25];
points = [[-1,1,0];[-1,-1,1];[1,-1,0];[1,1,-1]]';
h=fill3(points(1,:),points(2,:),points(3,:),'k');
set(h,'FaceAlpha',.8,'FaceColor',c3,'EdgeAlpha',0);

set(a,'XLim',lims,'YLim',lims,'ZLim',lims);
set(a,'XTick',[-1.25 0 1.25],'XTickLabel',{'','X',''},...
    'YTick',[-1.25 0 1.25],'YTickLabel',{'','Y',''},...
    'ZTick',[-1.25 0 1.25],'ZTickLabel',{'','Z',''})
a.CameraPosition=[13.3 -9.7 -5.4];
a.CameraViewAngle = 9;
a.View=[60 20];
grid on
saveas(f,'Figure_3Dhyperplane','png')