## Hierarquia de memória

No computador, a memória é responsável pelo armazenamento de dados e programas, e deve atender demandas do processador.

O acesso à memória é a etapa mais lenta no processamento, comprometendo o desempenho do computador como um todo.

Tecnologias de memória são desenvolvidas para melhorar o desempenho do computador, mas costumam possuir um custo muito alto, o que compromete seu uso em computadores pessoais.

Para obter um *trade-off* entre custo e desempenho, o sistema de memória é organizado de maneira hierárquica, com memórias mais rápidas e caras próximas ao processador, e memórias mais lentas e baratas mais distantes do processador.

Dessa forma, os dados são armazenados no nível mais lento e barato, e trafegam somente entre níveis adjacentes conforme demanda do processador. Para otimizar este tráfego, o armazenamento e lógica de requisições seguem duas premissas chamadas **princípios de localizade**:

1. **Localidade temporal:** um dado requisitado deve ser requisitado novamente

2. **Localidade espacial:** um dado requisitado deve estar próximo a outros dados requisitados  

Quando o processador requisita um dado, se ele estiver presente no nível 1, dizemos que houve um acerto. Caso contrário, dizemos que houve uma falha.

A **taxa de acerto (falha)** é a quantidade relativa de requisições que resultaram em **acerto (falha)**. A **penalidade de falha** é o tempo que o sistema de memória demora para carregar o dado no nível 1. O objetivo da organização hierárquica é **minimizar a taxa de falha**.

Em um computador genérico:
- Nível 1 é a *memória cache*
- Nível 2 é a *memória RAM*
- Nível 3 é o *disco* (HD, SSD, entre outras tecnologias persistentes).

### Memória cache

Quando o processador requisita um dado, ele referencia um endereço de memória do ado que dizemos endereço da **memória principal**. A memória principal é uma abstração oferecida pelo sistema operacional, que mapeia endereços de memória para endereços físicos.

A ideia da memória cache é armazenar cópias dos dados da memória principal de forma a minimizar a taxa de falhas atendendo da melhor forma os princípios de localidade.
### Mapeamento

A memória cache é organizada em blocos de tamanho fixo, e cada bloco possui um endereço de memória principal associado. Quando o processador requisita um dado, a memória cache verifica se o bloco está presente. Se estiver, dizemos que houve um **acerto**. Caso contrário, dizemos que houve uma **falha**.