opera-ros1-rocker
====================

`opera-ros1-rocker`を使うと、コマンド一つでOPERA(ROS1版)の環境を構築でき、すぐに開発が始められます。


--------
使い方
--------


必要ソフトウェアのインストール
------------------------------

以下のコマンドで最新のdockerをインストールしてください：

```
$ wget -O get-docker.sh https://get.docker.com
$ sudo sh ./get-docker.sh
```

以下のコマンドでrockerをインストールしてください：

```
$ sudo apt-get update
$ sudo apt-get install -y python3-rocker
```

nvidia-container-toolkitをインストールすると、GPUアクセラレーションを有効にしたROS環境を利用することができます（必須ではありません）。詳しくは以下のURLのドキュメントを参照してください。
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

利用方法
---------

本レポジトリをcloneして、以下のコマンドでdockerイメージをビルドしてください。

```
$ ./build.sh
```

以下のコマンドでrocker環境を立ち上げて環境内に入ります。

```
$ ./start.sh
```

rocker環境内ではセットアップ済みのOPERAソフトウェアを使って開発が始められます。

```
$ roslaunch /ws/all.launch
```

複数ターミナルを使って作業したい場合は、新しく開いたターミナル上で以下のコマンドを入力してrocker環境に入ってください。

```
$ ./enter.sh
```

