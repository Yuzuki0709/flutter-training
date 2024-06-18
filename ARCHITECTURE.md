## 基本方針
[こちら](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)の記事を参考にしました。
今回シンプルな機能なのでApplicationLayerは省略しました。


```mermaid
flowchart TB
  subgraph Arrows
    direction LR
    start1[ ] -..->|read| stop1[ ]
    style start1 height:0px;
    style stop1 height:0px;
    start2[ ] --->|listen| stop2[ ]
    style start2 height:0px;
    style stop2 height:0px;
    start3[ ] ===>|watch| stop3[ ]
    style start3 height:0px;
    style stop3 height:0px;
  end
  subgraph Type
    direction TB
    ConsumerWidget((widget));
    Provider[[provider]];
  end

  weatherScreenControllerProvider[["weatherScreenControllerProvider"]];
  yumemiWeatherRepositoryProvider[["yumemiWeatherRepositoryProvider"]];
  yumemiWeatherProvider[["yumemiWeatherProvider"]];
  WeatherScreen((WeatherScreen));

  weatherScreenControllerProvider ==> WeatherScreen;
  weatherScreenControllerProvider -.-> WeatherScreen;
  yumemiWeatherProvider ==> yumemiWeatherRepositoryProvider;
  yumemiWeatherRepositoryProvider -.-> weatherScreenControllerProvider
