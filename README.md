# Logic-Synthesis-Workshop

1 day workshop on RTL design and designed circuit estimation of power consumpton and chip area.

**-  1. Introduction: Verilog RTL design and setting development enviroment**

設計環境：  
Yosys    (論理合成ツール)  
OpenROAD (配置配線ツール)  

*ubuntuを使用しているなら、sudo apt installでインストールできます.  

また、PDKは"/eda/pdk"にセットアップしておいてください．  

まず所定の場所でこのリポジトリをダウンロードしてください．
gitを使っても良いし、直接ダウンロードしても構いません．  
cdを使用してディレクトリに入り、lsでファイルの状況を確認します．
![image](https://github.com/mercurius-rl/Logic-Synthesis-Workshop/assets/113878215/8ba3660a-4f29-4546-b2ff-cde274f317cd)

フォルダにはこのワークショップに使用するverilogのソースコード、制約ファイル、各種スクリプトが含まれています．  


使用するRTLは簡単なカウンタ回路です．
![image](https://github.com/mercurius-rl/Logic-Synthesis-Workshop/assets/113878215/c1ce2806-1ee6-4faf-8484-d20e25c4bab3)
クロックで駆動し、同期式リセットにより内部のリセットを行います．
enable信号が立ち上がっている場合に、クロックの立ち上がりに応じて内部のカウントを加算させます．
また、内部のカウントはo_countから直接外へ出力されている設計となっています．

このカウンタ回路を使っていきます．  
もし、Verilogそのものの書き方が分からない方は、このコードを写経しながら練習してみると良いかもしれません．

**-  2. Synthesis**
Synthesisとは論理合成のこと．

## yosys
yosysは、スタティックセルライブラリを使用してRTL設計データをネットリストへ変換するためのツールです．  
yosysは主に以下のコマンドを使用します．  
- read_verilog/read -sv: 設計ファイル(Verilog)を読み出す
- read_liberty -lib    : ライブラリファイル(スタティックセル)を読み出す
- proc, opt, techmap   : 最適化やテクノロジマッピング
- dfflibmap, abc       : ネットリストに対してセルを置き換える
- write_verilog        : ネットリストの出力

yosysのコマンドは.ysにスクリプトとして記載することで、まとめて実行することが出来ます．  
このワークショップで使うコマンドはsynth.ysにまとめています． 

**-  3. Implementation(Place and Routing): Estimation of Power Consumpton and Chip Area**
Implementationとは、直訳では実装．  
FPGAやASIC設計においては配置配線のフェーズを示します．

## OpenROAD
OpenROADは、ネットリストを実際のチップへのマッピングをする配置配線に使用するためのツールです．  
今回は、電力や面積の見積もりを行うだけです．
今回においては，OpenROADでは以下のコマンドを使用します．
- read_liberty/read_lef : スタティックセルを読み出す
- read_verilog          : verilogのネットリストを読み出す
- link_design           : ネットリストとスタセルを結合させる
- read_sdc              : 制約ファイルを読み出す(クロック信号の周波数等を記載)
- report***             : 結果の出力

OpenROADのコマンドは.tclにスクリプトとして記載することで、yosys同様にまとめて実行することが出来ます．
このワークショップで使うコマンドはreport_synth.tclにまとめています．  

添付のtclを実行すると以下のようにcounter回路の面積や電力の見積もりが出力されます．
![image](https://github.com/mercurius-rl/Logic-Synthesis-Workshop/assets/113878215/c1867070-6fb7-490e-a7d0-e6fefb69709a)

制約ファイル(sdc)にクロックの周期が記載されているので、この部分を変更することで消費電力と面積が
どのように変化するか確認してみましょう．  

以上でワークショップは終了です．お疲れさまでした．

