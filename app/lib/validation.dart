class Validation {
  String? campoEmail(String email) {
    if (email.isEmpty) {
      return 'Entre com seu e-mail';
    }
    if (!email.contains('@')) {
      return 'O email deve ser por exemplo seu-nome@mail.com';
    }
    if (email.length < 3) {
      return 'E-mail em formato inadequado';
    }
    return null;
  }

  String? campoSenha(String senha) {
    if (senha.isEmpty) {
      return 'Entre com sua senha';
    }
    if (senha.length < 4) {
      return 'A senha deve ter no mínimo 4 dígitos';
    }
    return null;
  }
}