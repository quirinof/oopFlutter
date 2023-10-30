class Ordenador{
  List ordenarCervejasPorNomeCrescente(List cervejas){
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do{
      trocouAoMenosUm = false;
      for (int i=0; i<cervejasOrdenadas.length-1; i++){
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i+1];
        if (atual["name"].compareTo(proximo["name"]) > 0){
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i+1];
          cervejasOrdenadas[i+1] = aux;
          trocouAoMenosUm = true;
        }
      }
    }while(trocouAoMenosUm);

    return cervejasOrdenadas;
  }


  List ordenarCervejasPorNomeDecrescente(List cervejas){
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do{
      trocouAoMenosUm = false;
      for (int i=0; i<cervejasOrdenadas.length-1; i++){
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i+1];
        if (atual["name"].compareTo(proximo["name"]) > 0){
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i+1];
          cervejasOrdenadas[i+1] = aux;
          trocouAoMenosUm = true;
        }
      }
    }while(trocouAoMenosUm);

    return cervejasOrdenadas;
  }


  List ordenarCervejasPorEstiloCrescente(List cervejas){
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do{
      trocouAoMenosUm = false;
      for (int i=0; i<cervejasOrdenadas.length-1; i++){
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i+1];
        if (atual["style"].compareTo(proximo["style"]) > 0){
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i+1];
          cervejasOrdenadas[i+1] = aux;
          trocouAoMenosUm = true;
        }
      }
    }while(trocouAoMenosUm);

    return cervejasOrdenadas;
  }


  List ordenarCervejasPorEstiloDecrescente(List cervejas){
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do{
      trocouAoMenosUm = false;
      for (int i=0; i<cervejasOrdenadas.length-1; i++){
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i+1];
        if (atual["style"].compareTo(proximo["style"]) > 0){
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i+1];
          cervejasOrdenadas[i+1] = aux;
          trocouAoMenosUm = true;
        }
      }
    }while(trocouAoMenosUm);
    
    return cervejasOrdenadas;
  }


  List ordenarCafesPorNomeCrescente(List cafes){
    List cafesOrdenados = List.of(cafes);
    bool trocouAoMenosUm;

    do{
      trocouAoMenosUm = false;
      for (int i=0; i<cafesOrdenados.length-1; i++){
        var atual = cafesOrdenados[i];
        var proximo = cafesOrdenados[i+1];
        if (atual["blend_name"].compareTo(proximo["blend_name"]) > 0){
          var aux = cafesOrdenados[i];
          cafesOrdenados[i] = cafesOrdenados[i+1];
          cafesOrdenados[i+1] = aux;
          trocouAoMenosUm = true;
        }
      }
    }while(trocouAoMenosUm);

    return cafesOrdenados;
  }


  List ordenarNacoesPorNomeCrescente(List nacoes){
    List nacoesOrdenadas = List.of(nacoes);
    bool trocouAoMenosUm;

    do{
      trocouAoMenosUm = false;
      for (int i=0; i<nacoesOrdenadas.length-1; i++){
        var atual = nacoesOrdenadas[i];
        var proximo = nacoesOrdenadas[i+1];
        if (atual["nationality"].compareTo(proximo["nationality"]) > 0){
          var aux = nacoesOrdenadas[i];
          nacoesOrdenadas[i] = nacoesOrdenadas[i+1];
          nacoesOrdenadas[i+1] = aux;
          trocouAoMenosUm = true;
        }
      }
    }while(trocouAoMenosUm);

    return nacoesOrdenadas;
  }
}