# <不動産のSHEELE ”シーレ”>

## サイト概要
### サイトテーマ
**不動産買取(仕入れ)業者と元付業者が安心してつながるアプリケーションの作成**

### テーマを選んだ理由
不動産買取（仕入れ）業者には、売却物件の情報をいち早く得て、安価に仕入れたいという需要が常にある。
買取をして再販売することで、仲介業よりも大きな売上高の実績を作り、会社の規模を拡大していくことができるからである。
そして、買取をするためには、一般市場の価格よりも安く購入することが前提となる。

ところが、現実には日ごろから付き合いのある不動産業者などから、売却物件情報をタイミングよく入手しなければならず、
いまだに個々の会社に電話や訪問営業をして情報収集をするという前時代的な手法が現役であり、より効率が良い方法を模索する必要がある。

そもそも、買取業者が購入できる物件というのは、不動産の売主が早期に売却しなければならないケースの不動産が主であるが、
売却を依頼された不動産業者（元付業者）は、安易に詳細な売却情報(売主の個人名や住所)を買取業者に流してしまうと、顧客（売主の依頼）を他社にとられてしまいかねないというリスクがある。

元付業者が付き合いのある買取業者に購入してもらい、手数料収入を得ることが最も売上効率が高いというのが業界ではスタンダードな価値観であるいっぽう、
自社で付き合いのある買取業者による買取価格が売主の目線(売却希望価格)に届かない場合、次に元付業者がすることは、より高い価格で購入できる業者がいないかを探すということである。

なぜなら、もし売主の納得する価格で買い取れる業者と元付業者が直接つながることができれば、両手仲介(売主・買主双方から仲介手数料を得ること)ができることに加え、
元付業者にとっては、できるだけ不動産買取業者へ卸したほうが、エンドユーザーに仲介するよりも仲介トラブル等のリスクも少なく、早々に話がまとまるため、売上効率が圧倒的に高いからである。

つまり、早期売却を依頼された元付業者にはリスクがあるだけに、最初から安全に買取業者を探すことができるのであれば、そこには買取業者、元付業者双方に一定の需要があるということになる。

なお、安全かどうかというのは、実務上、買取業者が自身の宅建業者としての身分を明かすことで安全性を担保しているものとされているが、もしアプリケーション上で買取業者の取引実績を見ることができれば、売却情報提供先の安全性について、元付業者はさらなる判断基準を得ることができる。

ところで、B to Bのオープンな不動産流通のシステムとして代表的であるのは、レインズという国土交通省の不動産流通機構であるが、ほぼすべての売り物件は、エンドユーザーの市場価格となっており、買取業者の仕入れ価格ではない。
そして私の知る得る限り、業者間同士が利用できるような早期売買を目的としたクローズドなサービスというのは、現在のところ普及していない。

そこで、不動産買取(仕入れ)業者と元付業者が安心してつながれるアプリケーションがあれば、一部の不動産仲介業の生産性と不動産流通の効率を向上させることが期待できると考え、テーマとして取り組むこととした。


### ターゲットユーザ
不動産業者専用のサービスのため、宅地建物取引業免許のある不動産会社に限定されます。<br>
-不動産買取業者<br>
-不動産の早期売却の媒介依頼を受託した元付仲介業者<br>

### 主な利用シーン
-不動産買取業者：買取再販物件を探す日常的な仕入れ営業時<br>
-元付仲介業者：早期売却が必要な案件で、買取業者を募集したい時<br>


### サービス概要
当サービスは、実際の取引に関わるのではなく、元付業者と買取業者を繋ぐための一次情報サービスです。<br>
宅建業者情報を登録して、元付業者は物件を登録するだけで、買取業者から反響を得られます。<br>
買取業者は仕入れ物件を簡単に検索できるようになります。<br>
なお、情報交換後の取引については、個々の事業者の責任と判断によるものとします。<br>
不動産の専門家が利用するサービスであるため、Googleマップの連携機能はありません。<br>


### 利用の流れ
1.不動産の早期売却の媒介依頼を受託した元付仲介業者が、SHEELEに物件情報を登録する。<br>
2.物件情報の一部が買取募集物件として公開される。<br>
3.不動産の仕入れを行おうとする業者(買取業者)が、条件に合う物件を検索する。<br>
4.買取業者が物件の詳細情報の閲覧を申請すると、元付業者へ通知される。<br>
5.元付業者は通知が届いた申請者情報を見ることで、買取業者の宅建業者情報を確認できる。<br>
6.元付業者が閲覧許可をすることで、買取業者は物件の詳細情報を閲覧することができるようになる。<br>
7.元付業者と買取業者は互いに連絡先を把握できるので、以降の商談は各自が自由に行う。<br>





## 設計書
- ER図： https://drive.google.com/file/d/1uhRn4yi5IydWGC1xmMAK2IqO8j925oF6/view?usp=sharing
- ワイヤーフレーム： https://drive.google.com/file/d/1okodA6XkBkgmgMCX89WTjdyTnIaxpKMY/view?usp=sharing
- 画面遷移図： https://drive.google.com/file/d/16a5sEslqBAHJSWXc6MaADE2-tBycei0R/view?usp=sharing
- テスト仕様書： https://docs.google.com/spreadsheets/d/1rANBQcdAkpbqd2gc609nfQWfDA1OTDpF/edit?usp=sharing&ouid=102164852019367143384&rtpof=true&sd=true
- WBS： https://docs.google.com/spreadsheets/d/1HBg-dBRxuEJQLIaKcGXfDwHP7ZXvr8ggGrrO4avo_i0/edit?usp=sharing
- テーブル定義書： https://docs.google.com/spreadsheets/d/1oTWwYVMQ8HMWYEWEXjIrLLwzhn5HzQ59PIdGb27EqcY/edit?usp=sharing
- アプリケーション詳細設計書： https://docs.google.com/spreadsheets/d/1lZUQfwzOzt_zNgUyh2yvFltJAwQyG0HZJCV-rXbmFa4/edit?usp=sharing

## 実装機能リスト
https://docs.google.com/spreadsheets/d/1x8YGVgQ3AacJWeA9Z76_SSvLIxj_YjwvlASEgNUh9TI/edit?usp=sharing

## 開発環境
- OS：Linux(CentOS
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- 画像
- photoAC: https://www.photo-ac.com/
- illustAC: https://www.ac-illust.com/