Pod::Spec.new do |s|

  s.name         = "ZLCommonCell"
  s.version      = "1.3"
  s.summary      = "ZLCommonCell"

  s.description  = <<-DESC
                      自己封装了一些常用的tableviewcell和collectionviewcell
                   DESC

  s.homepage     = "https://github.com/czl0325/ZLCommonCell"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "czl0325" => "295183917@qq.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/czl0325/ZLCommonCell.git", :tag => s.version }
  
  #s.ios.deployment_target = '8.0'
  s.source_files = "ZLCommonCellDemo/ZLCommomCell/*.{h,m}","ZLCommonCellDemo/ZLCommomCell/view/*.{h,m}"

  #s.resources = 'SXWaveAnimate/images/*.{png,xib}'
  #s.exclude_files = "Classes/Exclude"
  s.resource_bundles = {
    'ZLCommonCell' => ['ZLCommonCellDemo/ZLCommomCell/resource/*']
  }
  s.requires_arc = true
  s.dependency 'Masonry' 
  s.dependency 'SDWebImage'


end
