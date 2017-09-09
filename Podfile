platform :ios,’8.0’

#定义要安装的包
def pods
    pod 'SVProgressHUD'
    pod 'SDWebImage'
    pod 'AFNetworking'
    pod 'MJExtension'
    pod 'MJRefresh'
    

end

#创建targets
targetsArray = ['HKYosemite']

#循环加载包
targetsArray.each do |t|
   target t do
   pods
   end
end

