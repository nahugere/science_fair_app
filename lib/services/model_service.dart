class ModelService {

  final String name;
  final String description;
  final String model_link;
  final String more_info_text;
  final String more_info_link;

  ModelService({this.name, this.description, this.model_link, this.more_info_text, this.more_info_link});

  Map to_map() {
    return {
      "name": this.name,
      "description": this.description,
      "model_link": this.model_link,
      "more_info_text": this.more_info_text,
      "more_info_link": this.more_info_link
    };
  }

}