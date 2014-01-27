/*
This work is licensed under the Creative Commons Attribution 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

Author: @6elz

--------------------------------------------------------------------------------------
マニュアル:

    https://github.com/elvl/pso2-fukidashi-mosaic/wiki


ライセンス:

    このスクリプトは Creative Commons Attribution (CC-BY) で配布されるものとします。


設定の書き換え方:

    - ファイル名以外に全角文字を使わないで下さい。数値などは全て半角で書いて下さい
    - "" で囲われているところの "" をはずさないで下さい
    - 整数で指定すべき所で小数点のある数字を使わないでください
    
    コメント:
        # からその行の終わりまではコメントと見なされます。
        / * と * / とで囲まれた範囲もコメントと見なされます。 (ネストできないため / と * をここでは離して書いてあります)
        
    文字コード:
        ANSI (Shift-JIS) である必要があります。メモ帳で編集する場合は、そのまま保存すれば変更されることはありません
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
aup Aviutl のプロジェクトファイルを読み込む機能はデフォルトでは無効です。下の方にある設定を行って下さい
*/

fps = 30

/*
この指定は主に mp4 の読み込みで使われます
mp4 の読み込みでは、fps を指定しないと 24 fps にされることがあります
*/

/* --------------------------------------------------------------------------------------
マスクの指定
=============== */

ui_mask = "1280x720.png"

/*
チャットウィンドウ、パーティーメンバー名、入手メッセージ等を消す位置のマスクを指定して下さい
maskmaker フォルダの中にある html を開いて簡単に作成することができます (古い IE では動きません)
作成したマスクは mask フォルダに入れて下さい
マスクのサイズが動画と合ってない場合、適当に引き伸ばしたり動かしたりしますが
本当に適当であまり役にたたないので解像度にあったものを用意して下さい
*/

/* --------------------------------------------------------------------------------------
読み込んだ動画の扱い方
=============== */

prefer_pixel_type = "RGB32"

/*
avi の読み込みでは最初に RGB32 を試して、読み込めていなければ指定なしで試行します
アマレココで録画した動画を間違いなく扱うには RGB32 にしておいて下さい！
この挙動を変えたい場合 prefer_pixel_type を YV12 などに書き換えて下さい
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
動画フォーマットによってはクロップした結果や指定が奇数だと受け付けませんので、もしエラーが出たら偶数で指定して下さい
*/

/* --------------------------------------------------------------------------------------
UI 関係
=============== */

force_ui_mosaic = False

/*
[True / False] 
True  : コントラストが無いところでも、マスク画像で白い所は強制的に常にモザイクをかける
False : マスク画像の白い所の中でもコントラストのあるところにしかモザイクをかけない (デフォルト)

デフォルト動作では出来る限り余計なモザイクをかけません。これにより、チャットウィンドウに
他のウィンドウがかぶっているときにモザイクがかからないことが問題になるのならば
force_ui_mosaic を True にすることでコントラストにかかわらず強制的にモザイクをかけます
*/

ui_height = 100

/*
画面の下端から ui_height (px) の高さをパレットとみなして吹き出しモザイクの対象外とします
通常、吹き出しは画面の最下部には表示されないのと、パレット部分が誤検出の原因となるためです
*/

line_height = 2

/*
line_height は吹き出しの名前のある部分の上にある白線の高さ (px) です
通常 2px で、これが検出の要となっているため文字サイズが大きくなる画面設定だと吹き出しが検出できないと思われます
一応 2px 以外も設定できるようにしていますが、全くテストしていないのと他の数値を考慮していないので期待しないで下さい
1 にしてもハーフサイズの動画の吹き出し検出はできません
*/

/* --------------------------------------------------------------------------------------
Wave 終了検出
=============== */

disp_settings = False

/*
[True / False] 
True  : 座標関係の設定を画面に表示します
False : なにもしないでいつもどおり (デフォルト)

この機能を有効にすると、Wave 終了検出の座標の設定を画面に表示します。有効な位置になっているか確認することができます
*/

detect_wave_result = False          # [True / False] True で wave 終了時のリザルトの名前消しを行います
wave_reward_info_pos = 430          # 「ウェーブの報酬を受け取りました」 の帯の中心の動画上端からの距離 (px)
wave_countdown_info_pos_x = 260     # 「ウェーブ - 開始まであと」 とある文字の左上の動画右端からの距離 (px)
wave_countdown_info_pos_y = 296     # 「ウェーブ - 開始まであと」 とある文字の左上の動画上端からの距離 (px)
wave_result_pos = 150               # リザルト画面の動画上端からの距離 (px)
wave_result_h = 280                 # リザルト画面の高さ (px) よほど特殊な解像度でなければ大差無いはずです

/*
マニュアル https://github.com/elvl/pso2-fukidashi-mosaic/wiki/Wave-%E7%B5%82%E4%BA%86%E6%A4%9C%E5%87%BA

wave_reward_info_pos のデフォルトは、1280 x 720 用のものなので環境に合わせて適切に書き換えて下さい
wave_countdown_info_pos_x と wave_countdown_info_pos_y はよほど特殊な解像度でないかぎりこのままで良いはずです
wave_result_pos と wave_result_h も解像度で大差無いはずですが、リザルトのモザイクがずれる場合は調整して下さい
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

wrong_BT709 = False

/*
[True / False] 
True  : 何もしない (デフォルト)
False : 誤った色でエンコードしたとみなして甘く検出する

アマレココの動画をエンコードした mp4 などを読み込んで、モザイクがかからない吹出しがある場合
これを True にすると多分うまくいきます
(AMV3 を Aviutl で BT.709 として読み込んでエンコードしてしまった時のズレを考慮します)
*/

use_letter_search = True

/*
[True / False] 
True  : 文字検出を行う (デフォルト)
False : 文字検出を行わない

True にすると FPS が 2 程度下がりますが、明るいエフェクトが発生した時に背景に頻発する誤爆を大きく減らします
副次的な効果として画面中央左あたりのアイテム取得ログへのモザイクがまろやかになります
検出を厳密にするため、状態が悪い動画だとモザイク漏れが増える可能性があります
*/

use_fast_color_search = False

/*
[True / False] 
True  : 色検出をアバウトに行う
False : 色検出を普通に行う (デフォルト)

True にすると誤爆が少し増えますが FPS が大きく上がり、フルサイズの動画で 30fps で再生が可能になります
かなりさくさくになるので再生チェック時やもともと誤爆の少ない背景の時にはおすすめです (参考テスト環境: Core i7) 
*/

tolerance = 0

/*
[-4 - 24]
大きくすると色々な検出がいい加減になりますが、そのぶん誤爆が増えるのでできるだけ 0 推奨
生動画なのに 0 でまともに検出出来ない場合、明るさのスケール (後述) が合っていない可能性が高いです
[目安] 生動画 0 : 高画質な H264 0 から 6 : エンコしてつべにうpして再エンコされたやつ 10 以上 (つらい)
*/

/* --------------------------------------------------------------------------------------
Aviutl のプロジェクトファイルの読み込み
============================= */

# aviutl_vfp = "C:\Program Files (x86)\aviutl\aviutl.vfp"
# LoadVFAPIPlugin(aviutl_vfp, "AUPSource")

/*
AviUtil のプロジェクトファイル (aup) を読み込む場合は上 2 行のコメントを外して (行頭の # を消して下さい)
aviutl_vfp を実際に aviutl.vfp が存在するパスへ適切に書き換えて下さい。 aviutl.vfp は AviUtil と
同じフォルダの中に (あなたがそれを移動したり消していなければ) あります。

この機能は実験的なもので、拡張編集の内容はインポート出来ないなど制限があるはずです
作者はこれらの仕様に詳しくないのでサポートできません
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
*/

/* --------------------------------------------------------------------------------------
テスト用など
=============== */

luma_threshold = 160 # これをいじると全てがうまく行かなくなりますたぶん
test = False
stack_test = False
disp_info = False
error_msg = ""

#-----------------------------------------------------------------------------------------------------------
source = loadMedia(movie, prefer_pixel_type, Float(fps)).Crop(crop_left, crop_top, -crop_right, -crop_bottom, align=True)
source.AssumeFrameBased.modulo(32)
force_fps ? ChangeFPS(truncated_fps) : NOP

yv24 = isRGB ? ConvertToYV24(matrix="PC.709") : \
    full_scale_yuv_input ? ConvertToYV24 : ConvertToYV24.ColorYUV(levels="TV->PC")
y8 = yv24.ConvertToY8
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
    wave_fragment_count = 0
    wave_countdown_stop = 0"""
    
(detect_wave_result || disp_settings) ? Eval("""
    letter_height = 20
    crop_height_limit = yv24r.height - letter_height * 2
    wave_count_down_width = 16 * 12
    wave_ui_x = source.width - wave_countdown_info_pos_x
    
    error_msg = (wave_reward_info_pos < crop_height_limit) ? error_msg : error_msg + "wave_reward_info_pos が大きすぎます。\n"
    error_msg = (wave_countdown_info_pos_y < crop_height_limit) ? error_msg : error_msg + "wave_countdown_info_pos_y が大きすぎます。\n"
    error_msg = (wave_result_h + wave_result_pos < crop_height_limit) ? error_msg : error_msg + "wave_result_h か wave_result_pos が大きすぎます。\n"
    error_msg = (wave_countdown_info_pos_x > wave_count_down_width) ? error_msg : error_msg + "wave_countdown_info_pos_x が小さすぎます。\n特殊な解像度の場合お手数ですがスクリーンショットを添えて @6elz までご連絡下さい\n"
    error_msg = (wave_countdown_info_pos_x < source.width) ? error_msg : error_msg + "wave_countdown_info_pos_x が大きすぎます。\n"

    safe_geo_settings = error_msg.StrLen == 0
    error_msg = !safe_geo_settings ? error_msg + "\n無効な設定が検出されました。座標を動画の有効な範囲内におさめて下さい。\n" : error_msg
    error_msg = (detect_wave_result && !safe_geo_settings) ? error_msg + "wave 終了検出は無効にされました。\n" : error_msg
    error_msg = (disp_settings && !safe_geo_settings) ? error_msg + "設定値の確認は無効にされました。\n" : error_msg
""") : NOP

(detect_wave_result && safe_geo_settings) ? Eval("""
    framerate_ratio = 30.0 / yv24r.framerate
    wave_tol = tolerance + 16
    wave_reward_info_height = 50
    wave_fragment_limit = 60.0
    wave_suspend_limit = 300.0
    wave_current_frame_prev = 0

    wave_mask_prototype = BlankClip(width=yv24r.width, height=yv24r.height, length=360, color=$FFFFFF, pixel_type="Y8", fps=30) \
        .FadeIn0(10).FadeOut0(30).KillAudio.ChangeFPS(yv24r.framerate)
    wave_mask_full_length = wave_mask_prototype.BlankClip(length=yv24r.framecount).KillAudio.mt_binarize(127)
   
    wave_reward_info = yv24r.Crop(0, wave_reward_info_pos - letter_height / 2, 0, letter_height)
    wave_countdown_info = yv24r.Crop(int(wave_ui_x / 2), wave_countdown_info_pos_y, wave_count_down_width / 2, letter_height) \
        .MaskHS(minSat=30, maxSat=120, startHue=Max(0, 285 - tolerance), endHue=Min(360, 310 + tolerance), coring=false)
    wave_countdown_time = y8.Crop(wave_ui_x + 148, wave_countdown_info_pos_y + letter_height + 2, 16, int(letter_height / 2)).mt_binarize(115)
""" + wave_flush_status) : NOP

letter = use_letter_search ? letterMask(yv24, y8, tolerance) : y8r # dummy
header = Apply(use_fast_color_search ? "nameHeaderMaskYVFast" : "nameHeaderMaskYV", yv24ri, y8r, luma_threshold, tolerance, wrong_BT709)
findNameHeader(y8r, letter, header, frame, tolerance, line_height, use_letter_search)
Levels(0, mosaic_strength_2, Max(0, 255 - mosaic_strength_1), 0, 255, coring=false)
mt_logic(last, last.BlankClip(color=$FFFFFF).Letterbox(5, ui_height, 5, 5).mt_binarize(127), mode="and")

mosaic_mask = (detect_wave_result && safe_geo_settings) ? findWaveEnd(y8r, last, wave_result_pos, wave_result_h, test) : last

ImageSource(ScriptDir + "\mask\" + ui_mask, use_DevIL=true, start=0, end=1, pixel_type="RGB32").ConvertToY8(matrix="PC.709").KillAudio
resizeUiMask(source, last, mode="auto").modulo(32).PointResize(yv24r.width, yv24r.height)
ui_mask = Loop(yv24r.framecount, 0, 0) # 読み込み時にフレームを増設すると非常に遅くなるので Loop で水増しする

force_ui_mosaic ? ui_mask : Eval("""
    y8r.mt_edge
    use_letter_search ? mt_logic(last, letter.Letterbox(0, 0, int(width / 3), width / 2 - 24, color=$FFFFFF).mt_binarize(127), mode="and") : NOP
    BilinearResize(int(width / 10.0) * 2, int(height / 10.0) * 2)
    Apply(resizer, last, y8r.width, y8r.height)
    Levels(0, 1.0, 40, 0, 255, coring=false)
    mt_logic(last, ui_mask, mode="min")
""")

mt_logic(last, mosaic_mask, mode="max")

mask_r = last
mask_yuv_r = YtoUV(mask_r, mask_r, mask_r)
mask_yuv = Apply(resizer, mask_yuv_r, yv24.width, yv24.height)

yv24ri
BilinearResize(int(width / unit_size) * 2, int(height / unit_size / 2.0) * 2)
mosaic = Apply(resizer, last, yv24.width, yv24.height)

!test ? mt_merge(yv24, mosaic, mask_yuv, y=3, u=3, v=3).unModulo(source) : \
    mt_merge(yv24r, mask_r.ConvertToYV24, mask_yuv_r, y=3, u=3, v=3)

(disp_settings && safe_geo_settings) ? dispSettings(wave_reward_info_pos, wave_countdown_info_pos_x, \
    wave_countdown_info_pos_y, ui_height, letter_height, wave_count_down_width, wave_ui_x) : NOP

test && stack_test ? StackHorizontal(mask_y, last) : NOP

pixel_type = (output_pixel_type == "auto") ? source.pixelType : output_pixel_type
pixel_type = pixel_type.UCase
is_rgb = (FindStr(pixel_type, "RGB") > 0) ? True : False
out_is_fullscale = (is_rgb || full_scale_yuv_output) ? True : False
matrix = out_is_fullscale ? "PC.709" : "Rec709"

out_is_fullscale ? NOP : ColorYUV(levels="PC->TV")
(source.isYUY2 && pixel_type == "YUY2") ? ConvertBackToYUY2 : Eval("ConvertTo" + pixel_type + """(last, matrix="""" + matrix + """")""")

disp_info ? info : NOP
(error_msg.StrLen == 0) ? NOP : Subtitle(error_msg, y=10, x=10, lsp=24, font="メイリオ", size=24, text_color=$FFFF00, halo_color=$000000)

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
            && (YPlaneMedian > 45 - wave_tol) && (YPlaneMedian < 45 + wave_tol) \
                && (UPlaneMedian > 135 - wave_tol) && (UPlaneMedian < 135 + wave_tol) \
                    && (VPlaneMedian > 120 - wave_tol) && (VPlaneMedian < 120 + wave_tol))
        
        reward_display_end_now = wave_prev_status && !reward_displaying_now && wave_reward_display_count > 50
        wave_reward_display_count = reward_displaying_now ? wave_reward_display_count + framerate_ratio : 0
        wave_prev_status = reward_displaying_now
        
        wave_mask_full_length = reward_display_end_now ? \
            wave_mask_full_length.Trim(0, current_frame) + wave_mask_prototype + wave_mask_full_length.Trim(current_frame + wave_mask_prototype.framecount, 0) : wave_mask_full_length
        
        countdown_info_t = wave_countdown_info.AverageLuma > 70
        thresh_increase = ((wave_countdown_stop > 100 ? 4 : 0) + (countdown_info_t ? 1 : 0)) * framerate_ratio
        wave_fragment_count = (wave_suspend_count > 200) ? 0 : (thresh_increase > 0) ? wave_fragment_limit : Max(0, wave_fragment_count - framerate_ratio)
        wave_detection_thresh = (wave_fragment_count > 0) ? wave_detection_thresh + thresh_increase : 0
        wave_suspend_count = countdown_info_t ? Min(wave_suspend_limit, wave_suspend_count + framerate_ratio) : Max(0, wave_suspend_count - framerate_ratio)
        wave_countdown_stop = (wave_countdown_time.YDifferenceFromPrevious > 15) ? 0 : wave_countdown_stop + framerate_ratio

        wave_mask_full_length
    """)
    
    Letterbox(wave_result_pos, height - wave_result_h - wave_result_pos, int(width / 4), int(width / 2))
    ColorYUV(levels="TV->PC")
    mt_logic(last, name_mask, mode="max")
    
    test ? ScriptClip("""
        Subtitle( \
        " current_frame: " + String(current_frame) + \
        "\n seeked: " + String(seeked) + \
        "\n median: " + String(wave_reward_info.YPlaneMedian) + " " + String(wave_reward_info.UPlaneMedian) + " " + String(wave_reward_info.VPlaneMedian) + \
        "\n wave_countdown_stop: " + String(wave_countdown_stop) + \
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
    align = Default(align, False)
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
    align = Default(align, False)

    clip
    (offset > 0) ? Crop(0, 0, 0, -offset, align=align).AddBorders(0, offset, 0, 0) : Crop(0, -offset, 0, 0, align=align).AddBorders(0, 0, 0, -offset)
}

function shiftHorizontal(clip "clip", int "offset", bool "align")
{
    align = Default(align, False)

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

function findNameHeader(clip "y8", clip "letter", clip "header", clip "frame", int "tolerance", int "line_height", bool "strict")
{
    smoothBlur(header, threshold=Max(30, 80 - tolerance), w_ratio=8, h_ratio=1)
    Blur(1.0, 0.0).mt_binarize(170).Blur(0.0, 1.0).mt_binarize(170).mt_expand(mode="horizontal")
    
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
    Blur(0.0, 1.0).mt_binarize(170).Blur(1.0, 0.0).mt_binarize(170)
    upper_line = last
    
    frame = mt_logic(frame, frame.shiftVertical(-1, align=True), mode="or")
    header.mt_expand(mode="horizontal")
    header = mt_logic(last, last.shiftVertical(-line_height, align=True), mode="and")
    
    bottom_line
    mt_logic(last, upper_line.Invert, mode="and")
    mt_logic(last, frame, mode="and")
    mt_logic(last, frame.Invert.shiftVertical(line_height * 2), mode="and")
    mt_logic(last, header, mode="and")
    mt_logic(last, header.Invert.shiftVertical(line_height * 2), mode="and")
    Blur(0.0, 1.0).mt_binarize(170).Blur(1.0, 0.0).mt_binarize(170)
    bottom_line = last
    
    upper_line
    BilinearResize(width, int(height / line_height / 6)).BilinearResize(width, height)
    mt_binarize(0)
    upper_line = shiftVertical(line_height * 6, align=True)
    
    bottom_line
    BilinearResize(width, int(height / line_height / 6)).BilinearResize(width, height)
    mt_binarize(0)
    bottom_line = shiftVertical(line_height * -6, align=True)
    
    mt_logic(upper_line, bottom_line, mode="or")
    strict ? mt_logic(letter, last, mode="and") : NOP
    mt_logic(last, smoothBlur(header, threshold=190, w_ratio=8, h_ratio=12).Invert, mode="and")
    mt_logic(last, last.shiftHorizontal(-line_height * 2 - 1), mode="or")
    mt_expand(mode="horizontal")
    BilinearResize(int(width / 8.0) * 2, int(height / 10.0) * 2).BilinearResize(width, height)
    
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
    mt_inpand(mode="horizontal")
    Blur(0.0, 1.0).mt_binarize(170)
    Blur(1.0, 0.0).mt_binarize(170)
    mt_expand(mode="horizontal")
    
    return Invert.Invert # 何故か早くなる
}

function selectYUVRange(clip "yv24", clip "y8", int "min_luma", int "max_luma", int "min_sat", int "max_sat", int "start_hue", int "end_hue")
{
    return mt_logic(y8.mt_binarize(min_luma, mode="x 0").mt_binarize(max_luma, mode="0 x").mt_binarize(0), \
        yv24.MaskHS(minSat=min_sat, maxSat=max_sat, startHue=start_hue, endHue=end_hue, coring=false), \
        mode="and")
}

function nameHeaderMaskYV(clip "yv24", clip "y8", int "luma_threshold", int "tolerance", bool "wrong_BT709")
{
    wt = wrong_BT709 ? 4 : 0
    tol = tolerance + 2
    lt = luma_threshold - tol
    
    # pink - dull red : 65 - 130
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 70 - tol), max_luma=Min(lt, 110 + tol + wt), \
        min_sat=Max(0, 35 - tol - wt * 2), max_sat=Min(150, 60 + tol), \
        start_hue=65, end_hue=130)
    
    # pure red : 95 - 110
    pr = selectYUVRange(yv24, y8, \
        min_luma=Max(0, 55 - tol + wt * 3), max_luma=Min(lt, 80 + tol + wt * 8), \
        min_sat=Max(0, 50 - tol), max_sat=Min(150, 75 + tol), \
        start_hue=100, end_hue=130) \
        .mt_logic(last, mode="or")
    
    # orange - yellow - yellow green : 130 - 185
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 100 - tol), max_luma=Min(lt, 145 + tol + wt), \
        min_sat=Max(0, 40 - tol - wt), max_sat=Min(150, 75 + tol), \ 
        start_hue=140, end_hue=185)
    
    # green : 185 - 265
    yg = selectYUVRange(yv24, y8, \
        min_luma=Max(0, 80 - tol - wt * 3), max_luma=Min(lt, 120 + tol), \
        min_sat=Max(0, 30 - tol), max_sat=Min(150, 60 + tol), \ 
        start_hue=185, end_hue=265) \
        .mt_logic(last, mode="or")
    
    # teal - blue : 265 - 330
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 55 - tol), max_luma=Min(lt, 120 + tol), \
        min_sat=Max(0, 25 - tol), max_sat=Min(150, 65 + tol), \ 
        start_hue=265, end_hue=330)
    
    # purple 320 - 65
    bp = selectYUVRange(yv24, y8, \
        min_luma=Max(0, 55 - tol + wt * 2), max_luma=Min(lt, 80 + tol + wt * 3), \
        min_sat=Max(0, 35 - tol - wt), max_sat=Min(150, 65 + tol), \ 
        start_hue=320, end_hue=65) \
        .mt_logic(last, mode="or")
    
    mt_logic(pr, yg, mode="or")
    mt_logic(last, bp, mode="or")
    return last
}

function nameHeaderMaskYVFast(clip "yv24", clip "y8", int "luma_threshold", int "tolerance", bool "wrong_BT709")
{
    wt = wrong_BT709 ? 4 : 0
    tol = tolerance + 2
    lt = luma_threshold - tol
    
    # all
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 50 - tol), max_luma=Min(lt, 120 + tol), \
        min_sat=Max(0, 25 - tol), max_sat=Min(150, 75 + tol), \
        start_hue=0, end_hue=360)
    
    # pure red : 95 - 110
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 55 - tol), max_luma=Min(lt, 80 + tol + wt * 8), \
        min_sat=Max(0, 50 - tol), max_sat=Min(150, 75 + tol), \
        start_hue=100, end_hue=130) \
        .mt_logic(last, mode="or")
    
    # orange - yellow - yellow green : 130 - 185
    selectYUVRange(yv24, y8, \
        min_luma=Max(0, 100 - tol), max_luma=Min(lt, 145 + tol + wt), \
        min_sat=Max(0, 40 - tol - wt), max_sat=Min(150, 75 + tol), \ 
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

function letterMask(clip "yv24", clip "y8", int "tolerance")
{
        yv24
        mt_logic( \
            mt_logic(y8.mt_binarize(Max(190, 215 - tolerance)), \
            UtoY.mt_binarize(128 - 50, mode="x 0").mt_binarize(128 + 50, mode="0 x").mt_binarize(0), mode="and"), \
            VtoY.mt_binarize(128 - 50, mode="x 0").mt_binarize(128 + 50, mode="0 x").mt_binarize(0), mode="and")
        
        BilinearResize(int(width / 20.0) * 2, int(height / 10.0) * 2).BilinearResize(width / 2, height).mt_binarize(0)
        return last
}

function dispSettings(clip "yv24", int "rp", int "cx", int "cy", int "uh", int "lh", int "cw", int "ux")
{
    blank = yv24.BlankClip(color=$FFFFFF, length=1).KillAudio
    yv24.BlankClip(color=$000000, length=1).KillAudio
    _drawHorizontalLine(last, blank, rp, "wave_reward_info_pos", "「ウェーブの報酬を受け取りました」 の帯の中心")
    _drawHorizontalLine(last, blank, uh, "ui_height", "これより下側はふきだしの検出に含めません (パレット等の誤爆防止)", upper=True)
    
    mt_logic(last, blank.Letterbox(cy, height - cy - lh, ux, width - ux - cw, color=$000000), mode="or", y=3, u=2, v=2)
    mt_logic(last, blank.Letterbox(cy + lh + 2, height - (cy + lh + 2) - lh / 2, ux + 148, width - (ux + 148) - 16, color=$000000), mode="or", y=3, u=2, v=2)
    
    Subtitle("↑ ウェーブ終了/開始まであと ↑\n残り時間の下一桁\n" + \
        "wave_countdown_info_pos_x: " + String(cx) + \
        "\nwave_countdown_info_pos_y: " + String(cy), \
        y=cy + lh * 2, x=width - 10, lsp=20, font="メイリオ", size=20, text_color=$FFFF00, halo_color=$101010, align=9)
        
    sub = ColorYUV(levels="TV->PC")
    m = sub.ConvertToY8.mt_binarize(0).ColorYUV(off_y=180)
    mt_merge(yv24, sub, YtoUV(m, m, m), y=3, u=3, v=3)
   
    return last
}

function _drawHorizontalLine(clip "yv24", clip "blank", int "y", string "name", string "desc", bool "upper")
{
    yv24
    upper = Default(upper, False)
    desc = Default(desc, "")
    y2 = upper ? height - y : y

    blank.Letterbox(y2 - 1, height - y2 - 1, 0, 0, color=$000000)
    mt_logic(yv24, last, mode="or", y=3, u=2, v=2)
    Subtitle("↑ " + name + ": " + String(y) + " ↑\n" + desc, y=y2 + 5, x=10, lsp=20, font="メイリオ", size=20, text_color=$FFFF00, halo_color=$101010)
    
    return last
}

__END__

