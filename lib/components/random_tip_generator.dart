import 'dart:math';

class RandomTipGenerator {
  static List<String> _texts = [
    'A água é o único composto que pode ser encontrado naturalmente nos três estados: líquido, sólido (gelo) e gasoso (vapor).',
    'A molécula de água é única devido à sua estrutura em forma de V e às propriedades polares.',
    'A água é o único composto natural que pode ser encontrado em todos os três estados físicos da matéria simultaneamente em temperaturas normais da Terra.',
    'A água é um solvente universal, sendo capaz de dissolver muitas substâncias diferentes.',
    'A água pura é uma má condutora de eletricidade, mas quando dissolventes iônicos ou outros compostos estão presentes, ela se torna condutora.',
    'A água é essencial para a vida, e os seres humanos podem sobreviver apenas alguns dias sem consumi-la.',
    'A água é o principal componente das células do corpo humano, representando cerca de 60% do peso corporal médio.',
    'A água tem uma densidade máxima a 4 graus Celsius, o que significa que ela atinge sua maior densidade nessa temperatura e se expande tanto em temperaturas mais altas quanto mais baixas.',
    'A água pode existir em estados diferentes de pureza, desde água potável até a água do mar, que contém sais e minerais.',
    'A água cobre cerca de 71% da superfície da Terra.',
    'A água é o único componente que pode ser encontrado em todos os alimentos.',
    'A água tem um papel crucial na regulação da temperatura da Terra através do ciclo da água.',
    'A água é considerada um "solvente universal" devido à sua habilidade de dissolver uma variedade de substâncias.',
    'A cada gota de água que consumimos, estamos potencialmente ingerindo moléculas que passaram pelos rins de dinossauros, reis e rainhas ao longo da história.',
    'A água é um dos poucos compostos na Terra que ocorre naturalmente em todos os três estados da matéria.',
    'A quantidade total de água no planeta Terra permanece praticamente constante ao longo do tempo, graças ao ciclo da água.',
    'Gotas de chuva não são realmente em forma de lágrima, mas tendem a ser esféricas devido à tensão superficial.',
    'A água pode existir em um estado super-resfriado, permanecendo líquida abaixo de zero grau Celsius antes de congelar instantaneamente ao ser perturbada.',
    'Os cientistas acreditam que a água na Terra pode ter origens extraterrestres, trazidas por cometas ou asteroides primitivos.',
    'A água é fundamental para a fotossíntese nas plantas, processo pelo qual convertem a luz solar em energia.',
    'A água é um dos poucos compostos que expandem ao congelar, o que é crucial para a vida aquática, pois evita que os corpos d''água congelem completamente.',
    'A molécula de água pode existir em diferentes isótopos, como o deutério (um isótopo de hidrogênio), que é usado para rastrear movimentos e origens da água na natureza.',
    'A água é capaz de dissolver mais substâncias do que qualquer outro líquido conhecido, desempenhando um papel vital nos processos químicos do corpo.',
    'O Monte Everest, a montanha mais alta do mundo, tem uma quantidade significativa de água em forma de gelo e neve, contribuindo para os recursos hídricos globais.',
    'O corpo humano perde água continuamente através da respiração, suor e urina, e é importante repor essa perda para manter a saúde.',
    'A água é um excelente isolante térmico, o que ajuda a manter as temperaturas dos oceanos relativamente estáveis apesar das variações de temperatura na atmosfera.',
    'A água potável não é distribuída uniformemente pelo planeta, e muitas regiões enfrentam escassez de água doce.',
    'Em 2016, a NASA anunciou a descoberta de evidências de água líquida em Marte, aumentando a esperança de encontrar vida no planeta vermelho.',
    'A água desempenha um papel vital na formação e no desenvolvimento de cristais, incluindo a formação de neve e flocos de gelo.',
    'As gotas de chuva não são formadas apenas por moléculas de água; pequenas partículas, como poeira ou pólen, ajudam na nucleação das gotas.',
  ];

  static String getRandomTip() {
    final random = Random();
    final index = random.nextInt(_texts.length);
    return _texts[index];
  }
}
