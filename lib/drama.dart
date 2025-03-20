// ignore: file_names
class Drama {
  late String titulo;
  late int ano;
  late String descricao;
  late String diretor;
  
  Drama()
  {
    titulo = "";
    ano = 0;
    descricao = ""; 
    diretor = "";
  }

  Drama.v(this.titulo, this.ano, this.descricao, this.diretor);

  Drama.fromJson(Map<String, dynamic> json)
      : titulo = json["titulo"] as String,
        ano = json["ano"] as int,
        descricao = json["descricao"] as String,
        diretor = json["diretor"] as String;

   Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "ano": ano,
        "descricao": descricao,
        "diretor" : diretor
      };
        

}