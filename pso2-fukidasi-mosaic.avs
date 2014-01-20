/*
This work is licensed under the Creative Commons Attribution 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

Author: @6elz


はじめに
--------------------------------------------------------------------------------------
この Avisynth スクリプトは PSO2 の動画の吹き出しにモザイクをかけます。

このスクリプトの動作には、Avisynth 2.6.0 以上と masktools 2.0 が必要です。

一応メモ帳で編集できますが、コードのハイライトがないと設定だけでも見づらいので適当なエディタが無いのであれば
AvsPmod を導入すると楽かもしれません。文字コードは ANSI か SJIS にする必要があります。

Avisynth について簡単な説明:
    
    Avisynth はフレームサーバーです。一般的な動画では、動画の再生には動画ファイルが必要です。
    対して、フレームサーバーは動画ファイルを生成したり保存することなくリアルタイムに動画を生成して
    動画プレイヤーや動画編集アプリーケーションに渡すことができます。
    
    Avisynth では、どのように動画を生成するのかをスクリプトでテキストファイルに記述します。
    今読んでいるこれがそうです。スクリプトを記述したテキストファイルには avs という拡張子がついています。
    
    Avisynth を導入すると、スクリプトを記述したファイルを動画を再生できる様々なアプリケーション、
    例えばメディアプレイヤーや Aviutl, VirtualDub 等に読み込ませることができるようになります。
    (古い Aviutl ではそのままでは開けません。最新の Aviutl を導入して下さい)
    
    スクリプトが動画再生アプリケーションに読み込まれた時、裏側で Avisynth が活動を始めます。
    スクリプトの内容に従って一コマ一コマを生成しアプリケーションに渡します。
    この一連の流れは、全て自動的に、透過的に行われるのでユーザーが意識する必要はありません。
    
    ですから、スクリプトをアプリケーションに読み込ませて再生や編集をするときも、動画と同じように扱えるでしょう。


Avisynth 2.6 系のインストール:

    このスクリプトの動作には、Avisynth 2.6.0 以上が必要です。2.5 系と 2.6 系では大きく機能差があります。
    2.6 系は Alpha とされていますが非常に安定しています。

    http://sourceforge.net/projects/avisynth2/files/AviSynth_Alpha_Releases/

    ここから 2.6 系の最新のものを DL してインストールして下さい。構成は全てデフォルトで問題ありません。
    有志が 64bit 版をビルドしたものを非公式で公開していますが 64bit 版での動作は確認していません。
    64bit OS でも 32bit 版をインストールして全く問題ありません。


masktools 2 のインストール:

    masktools 2 は Avisynth のプラグインです。公開元は http://manao4.free.fr/ ですがわかりにくいです
    masktools-v2.0a48.zip がこれを書いている時点での最新です。 
    直接リンクは http://manao4.free.fr/masktools-v2.0a48.zip
    
    解凍して中にある mt_masktools-26.dll だけを取り出し、Avisynth をインストールしたフォルダの中にある
    plugins フォルダの直下に入れて下さい。
    (mt_masktools-25.dll は 2.5 系用なので使いません / 64bit 版の Avisynth をインストールしたなら x64)


実際の流れ:
    
    これを、Aviutl で読み込んでモザイク漏れを拡張編集などで消すという手順をおすすめします。
    なぜなら、Aviutl の拡張編集の内容は Avisynth へインポートできないからです。
    (できるようになっていたらすみません)
    ただ、これの処理はかなり重いので、どうにも重くて Aviutl 上で作業になんねーよという場合、AMV や
    UtVideo 等の可逆かそれに近いコーデックで一度中間ファイルを書きだして編集するようにすれば楽になるでしょう。
    
    
検出の限界:
    
    原寸動画にしか対応していません。
    このフィルタを掛ける前に、色や明るさ、特に明るさを変更しているとうまくいきません。
    フレーム間を補完するようなフレームレートの変更を行っていると画像にブラーがかかっているため検出できません。
    高解像度で標準より文字が大きいタイプの吹き出しにはおそらく対応していません。 (設定で対応できる可能性はあります)
    ウィンドウや他の吹き出しの下にある、うっすら見えている吹き出しは検出できません。
    そうでないものも動画の状態が悪いと検出できないことがあります。
    万一、名前の消えていない動画を公開してしまい問題が起きたとしても一切の責任は負いません。
    必ず最終的なチェックをするようにしてください。
    100% の名前消しを保証するものでも、そのように設計されているものでもありません。
    
    
吹き出し以外を消す機能:

    - マスクによって、UI 部分 (チャットウィンドウと PT メンバーの名前) を消す機能
    - マスクについては設定内の説明を参照
    - 防衛で wave 終了後の順位を消す機能
    
    
ライセンス:
    
    このスクリプトは Creative Commons Attribution (CC-BY) で配布されるものとします。


設定をするにあたり最低限以下のことに留意して下さい:

    数値、文字列、真偽値は区別されます:
        - 数値 "" で囲まれていない生の数字です。これを "" で囲んだり、全角数字で書くことはできません
        - 整数 (小数点のない数字) で指定すべき所で小数点のある数字を使うことはできません
        - 文字列 "" で囲まれた文字のことです
        - 真偽値 True か False で表される値です。大文字小文字の区別はしません。全角文字で書くことはできません
    
    コメント:
        # からその行の終わりまではコメントと見なされます。
        / * と * / とで囲まれた範囲もコメントと見なされます。 (ネストできないため / と * をここでは離して書いてあります)
        コメントはスクリプトの実行に何ら影響を与えません。
*/

/* --------------------------------------------------------------------------------------
読み込む動画
=============== */

movie = "D:\rec\test.avi"

/*
読み込める形式:

avi AMV3 など
mp4 読み込めない場合は Haali Media Splitter ( http://haali.su/mkv/ ) をインストールすると多分うまくいきます
png bmp jpg テスト用に動画の代わりに画像を読み込むのに使えます
avs Avisynth のスクリプトファイルそのもの
aup aup は AviUtil のプロジェクトファイルです。これを読み込む場合は下の設定も合わせて行って下さい
    ただし、拡張編集の内容はインポート出来なかった気がします
    
この avs ファイルをバッチファイルに投げてエンコードする時などのためには、ファイル名をフルパスで書いておくのを推奨します

AviUtil のプロジェクトファイルを読み込む場合は下 2 行のコメントを外して (行頭の # を消して下さい)
aviutl_vfp を実際に aviutl.vfp が存在するパスへ適切に書き換えて下さい。 aviutl.vfp は AviUtil と
同じフォルダの中に (あなたがそれを移動したり消していなければ) あります。
*/

# aviutl_vfp = "C:\Program Files (x86)\aviutl\aviutl.vfp"
# LoadVFAPIPlugin(aviutl_vfp, "AUPSource")

prefer_pixel_type = "RGB32"

/*
avi の読み込みでは最初に RGB32 を試して、読み込めていなければ指定なしで試行します
これは RGB のほうが何故か正しい色を出力する傾向がある AMV3を考慮した挙動です
この挙動を変えたい場合 prefer_pixel_type を YV12 などに書き換えて下さい
*/

fps = 30

/*
この指定は avi の読み込みでは使われません (正しい fps で常に読み込まれるため)
mp4 の読み込みでは、fps を指定しないと 24 fps にされることがあります
追記: モーションの検証等でなければ、録画の負荷的にも公開時にもフレームレートは 30fps が適切でしょう
特にこのスクリプトの処理は重いので、軽い設定で 30fps 再生が限界で、60fps では再生しながらの確認は難しくなります
*/

force_fps = False
truncated_fps = 15

/*
force_fps を True にすると、強制的に truncated_fps にフレームレートを切り詰めます
どうしても重い時のチェック時や元動画が 60fps 等の時に使えるかもしれません
*/

crop_top = 0            # 上
crop_bottom = 0         # 下
crop_left = 0           # 左
crop_right = 0          # 右

/*
動画にウィンドウ枠などの耳がある場合に上下左右を指定 px 切り落とします
動画フォーマットによってはクロップした結果や指定が奇数だとおこられますので、もしエラーが出たら偶数で指定して下さい
*/

/* --------------------------------------------------------------------------------------
UI 関係
=============== */

ui_mask = "1280x720.png"

/*
チャットウィンドウ、パーティーメンバー名、入手メッセージ等を消す位置のマスクを指定して下さい
maskmaker フォルダの中にある html を開いて簡単に作成することができます (古い IE では動きません)
作成したマスクは mask フォルダに入れて下さい
初期状態では、1280 x 720 用のサンプルのみあります
マスクのサイズが動画と合ってない場合、適当に引き伸ばしたり動かしたりしますが、あまり役にたたないのでできるだけ解像度に
あったものを用意して下さい
*/

ui_height = 100

/*
画面の下端から ui_height (px) の高さを武器パレット等の UI 部分とみなして吹き出しモザイクの対象外とします
通常、吹き出しは画面の最下部には表示されないのと、UI 部分が誤検出の原因となるためです
*/

line_height = 2

/*
line_height は吹き出しの名前のある部分の上にある白線の高さ (px) です
通常 2px で、これが検出の要となっているため文字サイズが大きくなる画面設定だと吹き出しが検出できないと思われます
一応 2px 以外も設定できるようにしていますが、全くテストしていないのと他の数値を考慮していないので期待しないで下さい
1 にしてもハーフサイズの動画の吹き出し検出はできません
*/

detect_wave_result = True           # [True / False] True で wave 終了時のリザルトの名前消しを行います
wave_reward_info_pos = 430          # 「ウェーブの報酬を受け取りました」 の帯の中心の動画上端からの距離 (px)
wave_title_pos = 188                # wave 終了時に 「WAVE 1 CLEAR」 とフラッシュするの文字の中心の動画上端からの距離 (px)
wave_countdown_info_pos_x = 1020    # 「ウェーブ - 開始まであと」 とある文字の左上の動画左端からの距離 (px)
wave_countdown_info_pos_y = 295     # 「ウェーブ - 開始まであと」 とある文字の左上の動画上端からの距離 (px)
wave_result_pos = 150               # リザルト画面の動画上端からの距離 (px)
wave_result_h = 280                 # リザルト画面の高さ (px) よほど特殊な解像度でなければ大差無いはずです

/*
この設定数値は、1280 x 720 用のものなので各自の環境に合わせて適切に書き換えて下さい。

wave 終了検出機能は、報酬画面等を利用して wave の終了タイミングを検出します
そのため、"WAVE CLEAR の表示から報酬画面が消えるまで" を一度は飛ばさずに再生する必要があります
スクリプトを再生しているツール上で報酬画面を飛び越したり戻ったりすると正常に動作しません
動画のエンコード時は必ずフレーム順に処理が行われるのでこのことは気にしなくてもよいでしょう

ただし、時間を切り詰めたり飛ばしたりするような編集を行う場合は別です
wave 終了検出機能を使いつつそのような編集を行いたい場合は動画を一旦中間ファイルに書き出すことを選択に入れると良いかもしれません

防衛動画以外で wave 終了検出機能を有効にすると意図しないものに反応する可能性があります
wave 終了検出機能を有効にすると、数 fps のコストがかかるので、防衛動画でないないならば detect_wave_result を False にすると軽くなります

"ウェーブ開始まであと" にチャットウィンドウがかぶっていて且つ「WAVE CLEAR」に吹き出しがかぶっていたりするとうまく検出できません
画面サイズによってはチャットを開いているだけで "ウェーブ開始まであと" に被るようです (その場合この機能は重くなるだけなので切って下さい)

(以下の図は等幅フォントでなければずれます)

wave_reward_info_pos
                     ----------
                          ↑
                          │ 帯の上や下までではなく真ん中まで
======================    ↓ 
   wave の報酬を受け取りました ---         
===============================

wave_title_pos
                    -----------
                          ↑
                          │ 帯の上や下までではなく真ん中まで
    ------------------    ↓ 
----   WAVE 1 CLEAR   -----
    ------------------

wave_countdown_info_pos_x, wave_countdown_info_pos_y
        ---------------
               ↑                   
               | y                 
               ↓                  
      x       +------------------
-------------> ウェーブ 3 開始まであと 
              +------------------
              | チャットウィンドウ
*/

/* --------------------------------------------------------------------------------------
ぼかし及びモザイク
=============== */

mosaic_fuwafuwa = False             # [True / False] True でモザイクではなくふわふわなやつ、わずかに遅くなる
mosaic_strength_1 = 0               # [0 - 255] ボケ具合 0 なかからふんわり ← → そとまでかっちり 255
mosaic_strength_2 = 1.0             # [0.1 - 10.0] ボケ具合の急激さ、1.0 で ok いじってもあまり変わりません
unit_size = 8                       # [2 - ] モザイクのコマの大きさ (px) or ボケの強さ


/* --------------------------------------------------------------------------------------
精度
=============== */

tolerance = 0

/*
[-4 - 24]
大きくすると色々な検出がいい加減になりますが、そのぶん誤爆が増えるのでできるだけ 0 推奨
生動画なのに 0 でまともに検出出来ない場合、明るさのスケール (後述) が合っていない可能性が高いです
[目安] 生動画 0 : 高画質な H264 0 から 6 : エンコしてつべにうpして再エンコされたやつ 10 以上 (つらい)
*/

use_fast_color_search = False

/*
[True / False] 
True  : 色検出をアバウトに行う
False : 色検出を普通に行う (デフォルト)

True にすると誤爆が少し増えますが FPS が大きく上がり、フルサイズの動画で 30fps で再生が可能になります
かなりさくさくになるので再生チェック時やもともと誤爆の少ない背景の時にはおすすめです (参考テスト環境: Core i7) 
...これが False でも浮遊とか海とか背景ですげえ誤爆しそうなんだけどテストしてないんですよ怖いな
*/

/* --------------------------------------------------------------------------------------
カラースケール
=============== */

full_scale_yuv_input = False

/*
[True / False] 
True  : 入力が YUV の時 フルスケールとして扱う
False : 入力が YUV の時 TV スケールとして扱う (デフォルト)

True にすると入力をフルスケール (PC スケール) の YUV とみなして扱います
AMV コーデックの出力設定で "スケール補正をしない" を有効にしている場合や
意図的にフルスケールの YUV 動画を扱う場合 True にして下さい (HD 動画やゲーム録画では時々あるようです)
スケールがあっていない場合、明るさが変わり正しく検出できません
(全体的に白かったり黒かったりする動画再生に経験はないでしょうか？)

入力が RGB の場合、このオプションは無視されます。
RGB にはフルスケールしか存在しないため、色の問題についてよくわからない場合は
RGB での出力要求を受け付けるコーデック (AMV 等) でエンコードした動画を使うのが確実です
*/

/* --------------------------------------------------------------------------------------
出力フォーマット
=============== */

output_pixel_type = "auto"
full_scale_yuv_output = False

/*
[auto / RGB32 / YV12 / YV24 / YUY2 / その他色々]
auto にすると入力されたときと同じタイプで出力します
full_scale_yuv_output が True かつ出力が YUV の場合フルスケールのまま出力します
出力が RGB の場合スケールは関係ありません (常にフルスケール)
full_scale_yuv_input が True で output_pixel_type が auto でも 
full_scale_yuv_output を True にしないと YUV での出力時はフルスケールになりません

入力と出力についてより詳しい説明が必要な場合はスクリプトの一番下に余計な説明が書いてあります
*/

/* --------------------------------------------------------------------------------------
テスト用など
=============== */

luma_threshold = 160 # これをいじると全てがうまく行かなくなりますたぶん
test = False
stack_test = False
disp_info = False

#-----------------------------------------------------------------------------------------------------------
source = loadMedia(movie, prefer_pixel_type, Float(fps)).Crop(crop_left, crop_top, -crop_right, -crop_bottom, align=True)
source.AssumeFrameBased.modulo(32)
force_fps ? ChangeFPS(truncated_fps) : NOP

yv24 = isRGB ? ConvertToYV24(matrix="PC.601") : \
    full_scale_yuv_input ? ConvertToYV24 : ConvertToYV24.ColorYUV(levels="TV->PC")

yv24r = yv24.PointResize(yv24.width / 2, yv24.height).KillAudio
y8r = yv24r.ConvertToY8
y8ri = y8r.mt_inpand(mode="horizontal")
frame = nameFrameMaskYV(yv24r, y8ri, luma_threshold, tolerance, line_height)
yv24ri = inpaintUV(y8ri, yv24r.UToY8, yv24r.VToY8, frame)
resizer = mosaic_fuwafuwa ? "BilinearResize" : "PointResize"

wave_flush_status = """
    wave_reward_display_count = 0
    wave_prev_status = False
    wave_reward_display_count = 0
    wave_detection_thresh = 0
    wave_suspend_count = 0
    wave_fragment_count = 0"""
    
detect_wave_result ? Eval("""
    letter_height = 20
   
    source_wh_info = "(movie width: " + String(source.width) + " height: " +  String(source.height) + ")"
    crop_height_limit = yv24r.height - letter_height * 2
    Assert(wave_reward_info_pos < crop_height_limit, "wave_reward_info_pos is too large " + source_wh_info)
    Assert(wave_title_pos < crop_height_limit, "wave_title_pos is too large " + source_wh_info)
    Assert(wave_countdown_info_pos_y < crop_height_limit, "wave_countdown_info_pos_y is too large " + source_wh_info)
    Assert(wave_result_h + wave_result_pos < crop_height_limit, "wave_result_h or wave_result_pos is too large " + source_wh_info)
    Assert(wave_countdown_info_pos_x + 16 * 6 * 2 < source.width, "wave_countdown_info_pos_x is too large " + source_wh_info)

    framerate_ratio = 30.0 / yv24r.framerate
    wave_countdown_info_pos_x = int(wave_countdown_info_pos_x / 2)
    wave_tol = tolerance + 8
    wave_reward_info_height = 50
    wave_fragment_limit = 100.0
    wave_suspend_limit = 300.0
    wave_current_frame_prev = 0

    wave_mask_prototype = BlankClip(width=yv24r.width, height=yv24r.height, length=360, color=$FFFFFF, pixel_type="Y8", fps=30) \
        .FadeIn0(10).FadeOut0(30).KillAudio.ChangeFPS(yv24r.framerate)
    wave_mask_full_length = wave_mask_prototype.BlankClip(length=yv24r.framecount).KillAudio.mt_binarize(127)
   
    wave_title_flash = y8r.Crop(0, wave_title_pos - letter_height / 2, 16 * 10, letter_height)
    wave_reward_info = yv24r.Crop(0, wave_reward_info_pos - letter_height / 2, 0, letter_height)
    wave_countdown_info = yv24r.Crop(wave_countdown_info_pos_x, wave_countdown_info_pos_y, 16 * 6, letter_height) \
        .MaskHS(minSat=30, maxSat=100, startHue=Max(0, 290 - tolerance), endHue=Min(360, 305 + tolerance), coring=false)
""" + wave_flush_status) : NOP

header = Apply(use_fast_color_search ? "nameHeaderMaskYVFast" : "nameHeaderMaskYV", yv24ri, y8r, luma_threshold, tolerance)
findNameHeader(y8r, header, frame, tolerance, line_height)
Levels(0, mosaic_strength_2, Max(0, 255 - mosaic_strength_1), 0, 255, coring=false)
mt_logic(last, last.BlankClip(color=$FFFFFF).Letterbox(5, ui_height, 5, 5).mt_binarize(127), mode="and")

mosaic_mask = detect_wave_result ? findWaveEnd(y8r, last, wave_result_pos, wave_result_h, test) : last

ImageSource(ScriptDir + "\mask\" + ui_mask, use_DevIL=true, start=0, end=1, pixel_type="RGB32").ConvertToY8(matrix="PC.601").KillAudio
resizeUiMask(source, last, mode="auto").modulo(32).PointResize(yv24r.width, yv24r.height)
ui_mask = Loop(yv24r.framecount, 0, 0) # 読み込み時にフレームを増設すると非常に遅くなるので Loop で水増しする

y8r.mt_edge
BilinearResize(int(width / 10.0) * 2, int(height / 10.0) * 2)
Apply(resizer, last, y8r.width, y8r.height)
Levels(0, 1.0, 40, 0, 255, coring=false)
mt_logic(last, ui_mask, mode="min")
mt_logic(last, mosaic_mask, mode="max")

mask_r = last
mask_yuv_r = YtoUV(mask_r, mask_r, mask_r)
mask_yuv = Apply(resizer, mask_yuv_r, yv24.width, yv24.height)

yv24ri
BilinearResize(int(width / unit_size) * 2, int(height / unit_size / 2.0) * 2)
mosaic = Apply(resizer, last, yv24.width, yv24.height)

!test ? mt_merge(yv24, mosaic, mask_yuv, y=3, u=3, v=3).unModulo(source) : \
    mt_merge(yv24r, mask_r.ConvertToYV24, mask_yuv_r, y=3, u=3, v=3)

test && stack_test ? StackHorizontal(mask_y, last) : NOP

pixel_type = (output_pixel_type == "auto") ? source.pixelType : output_pixel_type
pixel_type = pixel_type.UCase
is_rgb = (FindStr(pixel_type, "RGB") > 0) ? True : False
out_is_fullscale = (is_rgb || full_scale_yuv_output) ? True : False
matrix = out_is_fullscale ? "PC.601" : "Rec601"

out_is_fullscale ? NOP : ColorYUV(levels="PC->TV")
(source.isYUY2 && pixel_type == "YUY2") ? ConvertBackToYUY2 : Eval("ConvertTo" + pixel_type + """(last, matrix="""" + matrix + """")""")

disp_info ? info : NOP

return last

#-----------------------------------------------------------------------------------------------------------
function findWaveEnd(clip "y8", clip "name_mask", int "wave_result_pos", int "wave_result_h", bool "test") {
    y8

    ScriptClip("""
        seeked = wave_current_frame_prev + 1 != current_frame
        wave_current_frame_prev = current_frame
        
        seeked ? Eval(wave_flush_status) : NOP
        
        wave_reward_info
        reward_displaying_now = ((wave_detection_thresh > 70 || wave_reward_display_count > 0) \
            && (YPlaneMedian > 40 - wave_tol) && (YPlaneMedian < 40 + wave_tol) \
                && (UPlaneMedian > 135 - wave_tol) && (UPlaneMedian < 135 + wave_tol) \
                    && (VPlaneMedian > 120 - wave_tol) && (VPlaneMedian < 120 + wave_tol))
        
        reward_display_end_now = wave_prev_status && !reward_displaying_now && wave_reward_display_count > 50
        wave_reward_display_count = reward_displaying_now ? wave_reward_display_count + framerate_ratio : 0
        wave_prev_status = reward_displaying_now
        
        wave_mask_full_length = reward_display_end_now ? \
            wave_mask_full_length.Trim(0, current_frame) + wave_mask_prototype + wave_mask_full_length.Trim(current_frame + wave_mask_prototype.framecount, 0) : wave_mask_full_length
        
        countdown_info_t = wave_countdown_info.AverageLuma > 70
        thresh_increase = (((wave_title_flash.AverageLuma > 240) ? 20 : 0) + (countdown_info_t ? 1 : 0)) * framerate_ratio
        wave_fragment_count = (wave_suspend_count > 200) ? 0 : (thresh_increase > 0) ? wave_fragment_limit : Max(0, wave_fragment_count - framerate_ratio)
        wave_detection_thresh = (wave_fragment_count > 0) ? wave_detection_thresh + thresh_increase : 0
        wave_suspend_count = countdown_info_t ? Min(wave_suspend_limit, wave_suspend_count + framerate_ratio) : Max(0, wave_suspend_count - framerate_ratio)

        wave_mask_full_length
    """)
    
    Letterbox(wave_result_pos, height - wave_result_h - wave_result_pos, int(width / 4), int(width / 2))
    ColorYUV(levels="TV->PC")
    mt_logic(last, name_mask, mode="max")
    
    test ? ScriptClip("""
        Subtitle( \
        " current_frame: " + String(current_frame) + \
        "\n seeked: " + String(seeked) + \
        "\n display_count: " + String(wave_reward_display_count) + \
        "\n suspend_count: " + String(wave_suspend_count) + \
        "\n thresh: " + String(wave_detection_thresh) + \
        "\n fragment: " + String(wave_fragment_count), lsp=20, text_color=$FFFFFF, halo_color=$808080, y=20)
        
        last
    """) : NOP

    return last
}

function loadMedia(string "path", string "prefer_pixel_type", float "fps") {
    ext = RightStr(path, 3)

    (ext == "aup") ? AUPSource(path).FlipVertical : \
        (ext == "png" || ext == "jpg" || ext == "bmp") ? ImageSource(path, use_DevIL=true, start=0, end=1).Loop(10, 0, 0) : \
        (ext == "mp4") ? DirectShowSource(path, fps=fps, audio=true) : \
        (ext == "avs") ? AVISource(path) : \
        Eval("""
            try {
                AVISource(path, pixel_type=prefer_pixel_type)
            }
            catch (e) {
                (FindStr(e, "couldn't produce") > 0) ? AVISource(path) : Assert(False, e)
            }
        """)
    
    # DirectShowSource の失敗時にはエラーが発生せずに空のクリップが返されることがあるので framecount を見る
    # 長さが 0 の動画を投げる人のことは考慮しない
    Assert(IsClip && framecount > 0, "can't load movie: " + path)
    
    return last
}

function modulo(clip "clip", int "divisor") {
    clip
    AddBorders(0, 0, width % divisor, 0)
    return last
}

function unModulo(clip "clip", clip "source_clip", bool "align") {
    clip
    Default(align, False)
    Crop(0, 0, source_clip.width - width, 0, align=align)
    return last
}

function inpaintUV(clip "y", clip "u", clip "v", clip "thresh") {
    return YToUV(_inpaintUV(u, thresh), _inpaintUV(v, thresh), y)
}

function _inpaintUV(clip "y8", clip "thresh") {
    c128 = y8.mt_binarize(128)
    
    y8.mt_expand(mode="vertical").mt_expand(mode="vertical").mt_expand(mode="both")
    mt_logic(last, c128, mode="and")
    mt_logic(last, thresh.Invert, mode="min")
    upper = mt_logic(last, y8, mode="max")

    y8.mt_inpand(mode="vertical").mt_inpand(mode="vertical").mt_inpand(mode="both")
    mt_logic(last, c128, mode="or")
    mt_logic(last, thresh, mode="max")
    mt_logic(last, upper, mode="min")
    
    return last
}

function shiftVertical(clip "clip", int "offset", bool "align")
{
    Default(align, False)

    clip
    (offset > 0) ? Crop(0, 0, 0, -offset, align=align).AddBorders(0, offset, 0, 0) : Crop(0, -offset, 0, 0, align=align).AddBorders(0, 0, 0, -offset)
}

function shiftHorizontal(clip "clip", int "offset", bool "align")
{
    Default(align, False)

    clip
    (offset > 0) ? Crop(0, 0, -offset, 0, align=align).AddBorders(offset, 0, 0, 0) : Crop(-offset, 0, 0, 0, align=align).AddBorders(0, 0, -offset, 0)
}

function resizeUiMask(clip "clip", clip "ui_mask", string "mode")
{
    mode = Default(mode, "crop")
    max_gap = 24

    ui_mask
    mode = (mode == "auto" && (Abs(clip.width - width) < max_gap || Abs(clip.height - height) < max_gap)) ? "crop" : "height"
    (mode == "width") ? PointResize(clip.width, height * clip.width / width) : last
    (mode == "height") ? PointResize(width * clip.height / height, clip.height) : last
    (clip.width > width) ? AddBorders(0, 0, clip.width - width, 0) : Crop(0, 0, clip.width, 0)
    (clip.height > height) ? AddBorders(0, 0, 0, clip.height - height) : Crop(0, height - clip.height, 0, clip.height) 
    
    return last
}

function findNameHeader(clip "y8", clip "header", clip "frame", int "tolerance", int "line_height")
{    
    smoothBlur(header, threshold=Max(30, 80 - tolerance), w_ratio=8, h_ratio=1)
    Blur(1.0, 0.0).mt_binarize(170).Blur(0.0, 1.0).mt_binarize(170).Invert.Invert
    header_r = last
    header = header_r.Invert
    frame_r = frame.Invert
    upper_line = Subtract(y8, y8.shiftVertical(-line_height)).mt_binarize(Max(130, 150 - tolerance))
    bottom_line = Subtract(y8, y8.shiftVertical(line_height)).mt_binarize(Max(130, 140 - tolerance))
    
    upper_line
    mt_logic(last, frame, mode="and")
    mt_logic(last, frame_r.shiftVertical(line_height), mode="and")
    mt_logic(last, frame_r.shiftVertical(-line_height), mode="and")
    mt_logic(last, header, mode="and")
    mt_logic(last, header_r.shiftVertical(-line_height), mode="and")
    upper_line = cleanMask(last)
    
    frame = mt_logic(frame, frame.shiftVertical(-1, align=True), mode="or")
    header.mt_expand(mode="horizontal")
    header = mt_logic(last, last.shiftVertical(-line_height, align=True), mode="and")
    
    bottom_line
    mt_logic(last, upper_line.Invert, mode="and")
    mt_logic(last, frame, mode="and")
    mt_logic(last, frame.Invert.shiftVertical(line_height * 2), mode="and")
    mt_logic(last, header, mode="and")
    mt_logic(last, header.Invert.shiftVertical(line_height * 2), mode="and")
    bottom_line = cleanMask(last)
    
    upper_line
    BilinearResize(width, int(height / line_height / 6)).BilinearResize(width, height)
    mt_binarize(0)
    upper_line = shiftVertical(line_height * 6, align=True)
    
    bottom_line
    BilinearResize(width, int(height / line_height / 6)).BilinearResize(width, height)
    mt_binarize(0)
    bottom_line = shiftVertical(line_height * -6, align=True)
    
    mt_logic(upper_line, bottom_line, mode="or")
    mt_logic(last, smoothBlur(header, threshold=190, w_ratio=8, h_ratio=8).Invert, mode="and")
    mt_logic(last, last.shiftHorizontal(-line_height * 2 - 2), mode="or")
    BilinearResize(int(width / 10.0) * 2, int(height / 10.0) * 2).BilinearResize(width, height)
    
    return last
}

function smoothBlur(clip "y8", int "threshold", int "w_ratio", int "h_ratio")
{
    y8
    return BilinearResize(int(width / w_ratio / 2.0) * 2, int(height / h_ratio / 2.0) * 2).BilinearResize(width, height).mt_binarize(threshold)
}

function cleanMask(clip "y8")
{    
    y8
    Blur(1.58, 0.0).Blur(1.0, 1.0).mt_binarize(170)
    Blur(0.8, 0.5).mt_binarize(170)
    mt_expand(mode="horizontal").mt_expand(mode="horizontal")
    
    return Invert.Invert # 何故か早くなる
}

function selectYUVRange(clip "yv24", clip "y8", int "min_luma", int "max_luma", int "min_sat", int "max_sat", int "start_hue", int "end_hue")
{
    return mt_logic(y8.mt_binarize(min_luma, mode="x 0").mt_binarize(max_luma, mode="0 x").mt_binarize(0), \
        yv24.MaskHS(minSat=min_sat, maxSat=max_sat, startHue=start_hue, endHue=end_hue, coring=false), \
        mode="and")
}

function nameHeaderMaskYV(clip "yv24", clip "y8", int "luma_threshold", int "tolerance")
{
    tol = tolerance
    lt = luma_threshold - tol
    
    # pink - dull red : 65 - 130
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 80 - tol), max_luma=Min(lt, 120 + tol), \
        min_sat=Max(0, 25 - tol), max_sat=Min(150, 60 + tol), \
        start_hue=65, end_hue=130)
    
    # pure red : 95 - 110
    pr = selectYUVRange(yv24, y8, \
        min_luma=Max(0, 70 - tol), max_luma=Min(lt, 110 + tol), \
        min_sat=Max(0, 55 - tol), max_sat=Min(150, 80 + tol), \
        start_hue=100, end_hue=130) \
        .mt_logic(last, mode="or")
    
    # orange - yellow - yellow green : 130 - 185
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 100 - tol), max_luma=Min(lt, 150 + tol), \
        min_sat=Max(0, 40 - tol), max_sat=Min(150, 80 + tol), \ 
        start_hue=140, end_hue=185)
    
    # green : 185 - 265
    yg = selectYUVRange(yv24, y8, \
        min_luma=Max(0, 50 - tol), max_luma=Min(lt, 120 + tol), \
        min_sat=Max(0, 20 - tol), max_sat=Min(150, 55 + tol), \ 
        start_hue=185, end_hue=265) \
        .mt_logic(last, mode="or")
    
    # teal - blue : 265 - 330
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 50 - tol), max_luma=Min(lt, 115 + tol), \
        min_sat=Max(0, 25 - tol), max_sat=Min(150, 65 + tol), \ 
        start_hue=265, end_hue=330)
    
    # purple 320 - 65
    bp = selectYUVRange(yv24, y8, \
        min_luma=Max(0, 65 - tol), max_luma=Min(lt, 100 + tol), \
        min_sat=Max(0, 30 - tol), max_sat=Min(150, 65 + tol), \ 
        start_hue=320, end_hue=65) \
        .mt_logic(last, mode="or")
    
    mt_logic(pr, yg, mode="or")
    mt_logic(last, bp, mode="or")
    return last
}

function nameHeaderMaskYVFast(clip "yv24", clip "y8", int "luma_threshold", int "tolerance")
{
    tol = tolerance
    lt = luma_threshold - tol
    
    # all
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 50 - tol), max_luma=Min(lt, 120 + tol), \
        min_sat=Max(0, 20 - tol), max_sat=Min(150, 65 + tol), \
        start_hue=0, end_hue=360)
    
    # pure red : 95 - 110
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 70 - tol), max_luma=Min(lt, 110 + tol), \
        min_sat=Max(0, 55 - tol), max_sat=Min(150, 80 + tol), \
        start_hue=100, end_hue=130) \
        .mt_logic(last, mode="or")
    
    # orange - yellow - yellow green : 130 - 185
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 100 - tol), max_luma=Min(lt, 150 + tol), \
        min_sat=Max(0, 40 - tol), max_sat=Min(150, 80 + tol), \ 
        start_hue=140, end_hue=185) \
        .mt_logic(last, mode="or")
        
    return last
}

function nameFrameMaskYV(clip "yv24", clip "y8", int "luma_threshold", int "tolerance", int "line_height")
{
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, luma_threshold - tolerance), max_luma=255, \
        min_sat=0, max_sat=Min(150, 50 + tolerance), \ 
        start_hue=0, end_hue=360)
   
    cleanMask(last)
    return last
}


__END__

以下少し込み入った話
内部ではフルスケールの YV24 で処理しています
そのまま出力できれば劣化も無いため良いのですが、世の中には YV24 を受け付けないあれこれも多いです (Aviutl など)

元の動画が UtVideo 等で YV12 以上の精度を持っている場合、出力を YV24 にしてフルスケールの YV24 で 
x264 でエンコードするという選択は素敵だけども、残念ながら多くの再生環境が YV24 に対応していません

AMV コーデックは YV12 ですが RGB での出力要求を受け付け、YV12 で出力させてこっちで伸長するよりも
RGB で出力させたほうが何故か正確な色がでてきます (内部がフルスケール？) 細かい設定をしてもらうのは面倒だろうから
AMV のデフォルト設定で最もスケールの間違いが起きにくい RGB での読み込みを優先しています
このため、 AMV で録画したものをデフォルトの auto で出力するとおそらく出力が RGB になります

そうすると最終的に一般的な YV12 でのエンコードを行う場合
(AMV 内部 YV12 -> RGB) -> (このスクリプト内 YV24 -> RGB32) -> (VFW Aviutl etc) -> (エンコーダー)
と変換を交互に行う事になってしまいます
これが気になる場合、この設定を YV12 にして AMV コーデックのスケール補正のチェックも外し、入力を YV12 フルスケールにしてから
入力スケールの設定もして 出力も YV12 フルスケールで行うのがベストになります… が、めんどくさいでしょ？
俺ももうこれ書いてるだけでめんどくさいし、何をやってるかわかってないと明るくなったり暗くなったりするだけになるし相当拘りがない限り
間違いのない RGB 経由でいいと思う
気になる人は説明しなくてもその辺わかってる人だろうから (BT.701 じゃなきゃやだとか) 自分でスクリプト書き換えて下さい

プログラミングの知識がある人向けメモ
if else の制御構造はありません。三項演算子と Eval で同様の事が可能です。ループもありませんが、再帰で同じことが可能です。
last は最後に返された動画オブジェクトです。代入では last が更新されません。
フィルタ (Avisynth では動画を扱うメソッドのことをフィルタと言います) の第一引数が明示されていない場合、last が暗黙の第一引数になります。
ドットを使ってインボカントが明確な場合は当然ですがそれが第一引数になります。
引数のクリップが 2 つ以上ある場合、可読性のために last も明示していますがそれ以上の意味はありません。
変数にはローカルスコープとグローバルスコープがあります。ランタイムメソッドの中のローカル変数はトップレベルの素のローカル変数と同じ扱いになります(多分)
変数は代入した時点で型が決まります。
処理は全ての構文解析が終わったあとで、末端からツリーを遡って最短の経路になるように行われます

