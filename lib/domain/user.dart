class User {

  final int id;
  final int pessoaCodigo;
  final String nome;
  final bool ativo;
  final String celular;
  final String token;
  final int expires;
  final String role;

  User({this.id, this.pessoaCodigo, this.nome, this.ativo, this.celular, this.token, this.expires, this.role});

  User.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        pessoaCodigo = json['pessoaCodigo'],
        nome = json['nome'],
        ativo = json['ativo'],
        celular = json['celular'],
        token = json['token'],
        expires = json['expires'],
        role = json['role'];

//  Map<String, dynamic> toJson() =>
//      {
//        'userId':userId,
//        'id':id,
//        'title':title,
//        'boby':body
//      };

}