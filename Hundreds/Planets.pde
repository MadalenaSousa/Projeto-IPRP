class Planets {
  int ns;
  Star[] star;
  float raio;
  int soma;

  Planets() {
    ns=1;
    for (int i=0; i<ns; i++) {
      star = new Star[ns];
    }
    raio=30;
    soma=0;
  }

  Planets(int ns, Star[] star, float raio, int soma) {
    this.ns=ns;
    this.star=star;
    this.raio=raio;
    this.soma=soma;
  }

  void desenha1() {
    for (int i=0; i<ns; i++) {
      star[i].desenha();
    }
  }
}