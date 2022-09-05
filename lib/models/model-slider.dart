class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({required this.imageAssetPath,required this.title,required this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel(desc: '', title: '', imageAssetPath: '');

  //1
  sliderModel.setDesc("Create Your wallet account with us and save your bill payments");
  sliderModel.setTitle("Wallet");
  sliderModel.setImageAssetPath("assets/images/illustration.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(imageAssetPath: '', title: '', desc: '');

  //2
  sliderModel.setDesc("Use your wallet account to make bill payments at a lower cost");
  sliderModel.setTitle("Payment");
  sliderModel.setImageAssetPath("assets/images/illustration.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(imageAssetPath: '', title: '', desc: '');

  //3
  sliderModel.setDesc("Transfer cash from your wallet to your loved ones and to mobile money");
  sliderModel.setTitle("Transfer");
  sliderModel.setImageAssetPath("assets/images/illustration3.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(imageAssetPath: '', desc: '', title: '');

  return slides;
}