/*
This work is licensed under the Creative Commons Attribution 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

Author: @6elz


�͂��߂�
--------------------------------------------------------------------------------------
���� Avisynth �X�N���v�g�� PSO2 �̓���̐����o���Ƀ��U�C�N�������܂��B

���̃X�N���v�g�̓���ɂ́AAvisynth 2.6.0 �ȏ�� masktools 2.0 ���K�v�ł��B

�ꉞ�������ŕҏW�ł��܂����A�R�[�h�̃n�C���C�g���Ȃ��Ɛݒ肾���ł����Â炢�̂œK���ȃG�f�B�^�������̂ł����
AvsPmod �𓱓�����Ɗy��������܂���B�����R�[�h�� ANSI �� SJIS �ɂ���K�v������܂��B


Avisynth �ɂ��ĊȒP�Ȑ���:
    
    Avisynth �̓t���[���T�[�o�[�ł��B�t���[���T�[�o�[�͓���������A�v���P�[�V���� (�v���C���[�� Aviutl ��)
    �ɑ΂��ē���̂悤�ɐU�镑���܂��BAvisynth ���A�v���P�[�V�����ɓ����v�������Ƃ��̏�Ń��A���^�C����
    �t���[��������ēn���܂��B�ǂ̂悤�ɓ������邩�������Ă���̂����̃t�@�C���ł��B
    
    Avisynth ���C���X�g�[���������_�ŁA����������A�v���P�[�V��������� avs �t�@�C���͊��ɓ���Ɍ����Ă��܂��B
    �E�B���h�E�Y���f�B�A�v���C���[�͂��߉�ȕ���������Ă��܂����������Ă����ނƍĐ����܂��B
    Aviutl �Ȃ��قǌÂ��o�[�W�����ł͂Ȃ�������ʂȎ������Ȃ��Ă����̂܂ܓǂݍ��߂�͂��ł��B


Avisynth 2.6 �n�̃C���X�g�[��:

    2.5 �n�ł͓����܂���B2.6 �n�� Alpha �Ƃ���Ă��܂������Ɉ��肵�Ă��܂��B
    �����Ԃ�O�ɃC���X�g�[�������ꍇ�� 2.5 �n�̉\���������ł��B

    http://sourceforge.net/projects/avisynth2/files/AviSynth_Alpha_Releases/

    �������� 2.6 �n�̍ŐV�̂��̂� DL ���ăC���X�g�[�����ĉ������B
    (�L�u�� 64bit �ł��r���h�������̂����J���Ă��܂��� 64bit �łł̓���͊m�F���Ă��܂���)


masktools 2 �̃C���X�g�[��:

    masktools 2 �� Avisynth �̃v���O�C���ł��B�_�E�����[�h�� http://manao4.free.fr/ �ł����킩��ɂ����ł�
    masktools-v2.0a48.zip ������������Ă��鎞�_�ł̍ŐV�ł��B 
    ���ڃ����N�� http://manao4.free.fr/masktools-v2.0a48.zip
    
    �𓀂��Ē��ɂ��� mt_masktools-26.dll ���AAvisynth ���C���X�g�[�������t�H���_�̒��ɂ���
    plugins �t�H���_�̒����ɓ���ĉ������B
    (mt_masktools-25.dll �� 2.5 �n�p�Ȃ̂Ŏg���܂��� / 64bit �ł� Avisynth ���C���X�g�[�������Ȃ� x64)


���ۂ̗���:
    
    Aviutl ���g���Ă���Ɖ��肵�܂��B�g�������͓�ʂ肠��܂��B
    
    1. ������AAviutl �œǂݍ���Ń��U�C�N�R����g���ҏW�Ȃǂŏ���
    2. ���̋t�� Aviutl �ŉ��������̂�����œǂݍ���
    
    ��{�I�ɂ� 1 ���������߂��܂��B�Ȃ��Ȃ�AAviutl �̊g���ҏW�̓C���|�[�g�ł��Ȃ������悤�ȋC�����邩��ł��B
    �G���R�[�h�Ȃǂ� Aviutl �ōs���̂Ȃ�΁AAviutl ���ŏI�ҏW�ł���ق����ǂ��͂��ł��B
    �����A����̏����͂��Ȃ�d���̂ŁA�ǂ��ɂ��d���� Aviutl ��ō�ƂɂȂ�ˁ[��Ƃ����ꍇ�AAMV ��
    UtVideo ���̉t������ɋ߂��R�[�f�b�N�ň�x���ԃt�@�C�������������ĕҏW����悤�ɂ���Ίy�ɂȂ�ł��傤�B
    
    
���o�̌��E:
    
    ��������ɂ����Ή����Ă��܂���B
    ���̃t�B���^���|����O�ɁA�F�▾�邳�A���ɖ��邳��ύX���Ă���Ƃ��܂������܂���B
    �t���[���Ԃ�⊮����悤�ȃt���[�����[�g�̕ύX���s���Ă���Ɖ摜�Ƀu���[���������Ă��邽�ߌ��o�ł��܂���B
    ���𑜓x�ŕW����蕶�����傫���^�C�v�̐����o���ɂ͂����炭�Ή����Ă��܂���B (�ݒ�őΉ��ł���\���͂���܂�)
    �E�B���h�E�⑼�̐����o���̉��ɂ���A�������猩���Ă��鐁���o���͌��o�ł��܂���B
    �����łȂ����̂�����̏�Ԃ������ƌ��o�ł��Ȃ����Ƃ�����܂��B
    ����A���O�̏����Ă��Ȃ���������J���Ă��܂���肪�N�����Ƃ��Ă���؂̐ӔC�͕����܂���B
    �K���ŏI�I�ȃ`�F�b�N������悤�ɂ��Ă��������B
    100% �̖��O������ۏ؂�����̂ł��A���̂悤�ɐ݌v����Ă�����̂ł�����܂���B
    
    
�����o���ȊO�������@�\:

    - �}�X�N�ɂ���āAUI ���� (�`���b�g�E�B���h�E�� PT �����o�[�̖��O) �������@�\
    - �}�X�N�ɂ��Ă͐ݒ���̐������Q��
    - �h�q�� wave �I����̏��ʂ������@�\
    
    
���C�Z���X:
    
    ���̃X�N���v�g�� Creative Commons Attribution (CC-BY) �Ŕz�z�������̂Ƃ��܂��B


�ݒ������ɂ�����Œ���ȉ��̂��Ƃɗ��ӂ��ĉ�����:

    ���l�A������A�^�U�l�͋�ʂ���܂�:
        - ���l "" �ň͂܂�Ă��Ȃ����̐����ł��B����� "" �ň͂񂾂�A�S�p�����ŏ������Ƃ͂ł��܂���
        - ���� (�����_�̂Ȃ�����) �Ŏw�肷�ׂ����ŏ����_�̂��鐔�����g�����Ƃ͂ł��܂���
        - ������ "" �ň͂܂ꂽ�����̂��Ƃł�
        - �^�U�l True �� False �ŕ\�����l�ł��B�啶���������̋�ʂ͂��܂���B�S�p�����ŏ������Ƃ͂ł��܂���
    
    �R�����g:
        # ���炻�̍s�̏I���܂ł̓R�����g�ƌ��Ȃ���܂��B
        / * �� * / �Ƃň͂܂ꂽ�͈͂��R�����g�ƌ��Ȃ���܂��B (�l�X�g�ł��Ȃ����� / �� * �������ł͗����ď����Ă���܂�)
        �R�����g�̓X�N���v�g�̎��s�ɉ���e����^���܂���B
*/

/* --------------------------------------------------------------------------------------
�ǂݍ��ޓ���
=============== */

movie = "D:\rec\test.avi"

/*
�ǂݍ��߂�`��:

avi AMV3 �Ȃ�
mp4 �ǂݍ��߂Ȃ��ꍇ�� Haali Media Splitter ( http://haali.su/mkv/ ) ���C���X�g�[������Ƒ������܂������܂�
png bmp jpg �e�X�g�p�ɓ���̑���ɉ摜��ǂݍ��ނ̂Ɏg���܂�
avs Avisynth �̃X�N���v�g�t�@�C�����̂���
aup aup �� AviUtil �̃v���W�F�N�g�t�@�C���ł��B�����ǂݍ��ޏꍇ�͉��̐ݒ�����킹�čs���ĉ�����
    �������A�g���ҏW�̓��e�̓C���|�[�g�o���Ȃ������C�����܂�
    
���� avs �t�@�C�����o�b�`�t�@�C���ɓ����ăG���R�[�h���鎞�Ȃǂ̂��߂ɂ́A�t�@�C�������t���p�X�ŏ����Ă����̂𐄏����܂�

AviUtil �̃v���W�F�N�g�t�@�C����ǂݍ��ޏꍇ�͉� 2 �s�̃R�����g���O���� (�s���� # �������ĉ�����)
aviutl_vfp �����ۂ� aviutl.vfp �����݂���p�X�֓K�؂ɏ��������ĉ������B aviutl.vfp �� AviUtil ��
�����t�H���_�̒��� (���Ȃ���������ړ�����������Ă��Ȃ����) ����܂��B
*/

# aviutl_vfp = "C:\Program Files (x86)\aviutl\aviutl.vfp"
# LoadVFAPIPlugin(aviutl_vfp, "AUPSource")

prefer_pixel_type = "RGB32"

/*
avi �̓ǂݍ��݂ł͍ŏ��� RGB32 �������āA�ǂݍ��߂Ă��Ȃ���Ύw��Ȃ��Ŏ��s���܂�
����� RGB �̂ق������̂��������F���o�͂���X�������� AMV3���l�����������ł�
���̋�����ς������ꍇ prefer_pixel_type �� YV12 �Ȃǂɏ��������ĉ�����
*/

fps = 30

/*
���̎w��� avi �̓ǂݍ��݂ł͎g���܂��� (������ fps �ŏ�ɓǂݍ��܂�邽��)
mp4 �̓ǂݍ��݂ł́Afps ���w�肵�Ȃ��� 24 fps �ɂ���邱�Ƃ�����܂�
�ǋL: ���[�V�����̌��ؓ��łȂ���΁A�^��̕��דI�ɂ����J���ɂ��t���[�����[�g�� 30fps ���K�؂ł��傤
���ɂ��̃X�N���v�g�̏����͏d���̂ŁA�y���ݒ�� 30fps �Đ������E�ŁA60fps �ł͍Đ����Ȃ���̊m�F�͓���Ȃ�܂�
*/

force_fps = False
truncated_fps = 15

/*
force_fps �� True �ɂ���ƁA�����I�� truncated_fps �Ƀt���[�����[�g��؂�l�߂܂�
�ǂ����Ă��d�����̃`�F�b�N���⌳���悪 60fps ���̎��Ɏg���邩������܂���
*/

/* --------------------------------------------------------------------------------------
UI �֌W
=============== */

ui_mask = "1280x720.png"

/*
�`���b�g�E�B���h�E�A�p�[�e�B�[�����o�[���A���胁�b�Z�[�W���������ʒu�̃}�X�N���w�肵�ĉ�����
1280 x 720 �p�̃T���v���݂̂���܂�
���̉𑜓x��z�u�̏ꍇ������Q�l�ɍ쐬���Amask �t�H���_�ɓ���ĉ�����
�T�C�Y�������ĂȂ��ꍇ�A�K���Ɉ����L�΂����蓮�������肵�܂������܂���ɂ����Ȃ��̂łł��邾���𑜓x�ɂ��������̂�p�ӂ��ĉ�����
���ɋ߂���΋߂��قǃ��U�C�N������������܂�
*/

ui_height = 100

/*
��ʂ̉��[���� ui_height (px) �̍����𕐊�p���b�g���� UI �����Ƃ݂Ȃ��Đ����o�����U�C�N�̑ΏۊO�Ƃ��܂�
�ʏ�A�����o���͉�ʂ̍ŉ����ɂ͕\������Ȃ��̂ƁAUI �������댟�o�̌����ƂȂ邽�߂ł�
*/

line_height = 2

/*
line_height �͐����o���̖��O�̂��镔���̏�ɂ��锒���̍��� (px) �ł�
�ʏ� 2px �ŁA���ꂪ���o�̗v�ƂȂ��Ă��邽�ߕ����T�C�Y���傫���Ȃ��ʐݒ肾�Ɛ����o�������o�ł��Ȃ��Ǝv���܂�
�ꉞ 2px �ȊO���ݒ�ł���悤�ɂ��Ă��܂����A�S���e�X�g���Ă��Ȃ��̂Ƒ��̐��l���l�����Ă��Ȃ��̂Ŋ��҂��Ȃ��ŉ�����
1 �ɂ��Ă��n�[�t�T�C�Y�̓���̐����o�����o�͂ł��܂���
*/

detect_wave_result = True           # [True / False] True �� wave �I�����̃��U���g�̖��O�������s���܂�
wave_reward_info_pos = 430          # �u�E�F�[�u�̕�V���󂯎��܂����v �̑т̒��S�̓����[����̋��� (px)
wave_title_pos = 188                # wave �I������ �uWAVE 1 CLEAR�v �ƃt���b�V������̕����̒��S�̓����[����̋��� (px)
wave_countdown_info_pos_x = 1020    # �u�E�F�[�u - �J�n�܂ł��Ɓv �Ƃ��镶���̍���̓��捶�[����̋��� (px)
wave_countdown_info_pos_y = 295     # �u�E�F�[�u - �J�n�܂ł��Ɓv �Ƃ��镶���̍���̓����[����̋��� (px)
wave_result_pos = 150               # ���U���g��ʂ̓����[����̋��� (px)
wave_result_h = 280                 # ���U���g��ʂ̍��� (px) ��قǓ���ȉ𑜓x�łȂ���Α卷�����͂��ł�

/*
wave �I�����o�@�\�́A��V��ʓ������o���ē��莞�Ԍ�Ƀ��U�C�N�������܂�
���̂��߁A�X�N���v�g���Đ����Ă���c�[����ŕ�V��ʂ��щz������߂����肷��Ɛ���ɓ��삵�܂���
����̃G���R�[�h���͕K���t���[�����ɏ������s����̂ł��̂��Ƃ͋C�ɂ��Ȃ��Ă��悢�ł��傤

�h�q����ȊO�� wave �I�����o�@�\��L���ɂ���ƈӐ}���Ȃ����̂ɔ�������\��������܂�
wave �I�����o�@�\��L���ɂ���ƁA�� fps �̃R�X�g��������̂ŁA�h�q����łȂ��Ȃ��Ȃ�� detect_wave_result �� False �ɂ���ƌy���Ȃ�܂�

"�E�F�[�u�J�n�܂ł���" �Ƀ`���b�g�E�B���h�E�����Ԃ��Ă��Ċ��uWAVE CLEAR�v�ɐ����o�������Ԃ��Ă����肷��Ƃ��܂����o�ł��܂���
��ʃT�C�Y�ɂ���Ă̓`���b�g���J���Ă��邾���� "�E�F�[�u�J�n�܂ł���" �ɔ��悤�ł� (���̏ꍇ���̋@�\�͏d���Ȃ邾���Ȃ̂Ő؂��ĉ�����)

�܂��A�G����������܂������̃��b�Z�[�W���댟�o���Ȃ����߂ɁA����̈�Ԃ͂��߂ƑO��̃E�F�[�u�I�������莞�Ԍ��o���~���Ă��܂�
���̂Ƃ����̃E�F�[�u�܂ł̎��Ԃ�؂���������ł�������A"�E�F�[�u�J�n�܂ł���" �̕\���Ƀ`���b�g�E�B���h�E�����Ԃ��Ă���Ƃ��̓��삪����ɍs���܂���
wave �I�����o�@�\���g�����̂悤�ȕҏW���s�������ꍇ�͓������U���ԃt�@�C���ɏ����o�����Ƃ�I���ɓ����Ɨǂ���������܂���

(�ȉ��̐}�͓����t�H���g�łȂ���΂���܂�)

wave_reward_info_pos
                     ----------
                          ��
                          �� �т̏�≺�܂łł͂Ȃ��^�񒆂܂�
========================= �� ===
   wave �̕�V���󂯎��܂��� ---         
===============================

wave_title_pos
                    -----------
                          ��
                          �� �т̏�≺�܂łł͂Ȃ��^�񒆂܂�
    ------------------    �� 
----   WAVE 1 CLEAR   -----
    ------------------

wave_countdown_info_pos_x, wave_countdown_info_pos_y
        ---------------
               ��                   
               | y                 
               ��                  
      x       +------------------
-------------> �E�F�[�u 3 �J�n�܂ł��� 
              +------------------
              | �`���b�g�E�B���h�E
*/

/* --------------------------------------------------------------------------------------
�ڂ����y�у��U�C�N
=============== */

mosaic_fuwafuwa = False             # [True / False] True �Ń��U�C�N�ł͂Ȃ��ӂ�ӂ�Ȃ�A�킸���ɒx���Ȃ�
mosaic_strength_1 = 0               # [0 - 255] �{�P� 0 �Ȃ�����ӂ��� �� �� ���Ƃ܂ł������� 255
mosaic_strength_2 = 1.0             # [0.1 - 10.0] �{�P��̋}�����A1.0 �� ok �������Ă����܂�ς��܂���
unit_size = 8                       # [2 - ] ���U�C�N�̃R�}�̑傫�� (px) or �{�P�̋���


/* --------------------------------------------------------------------------------------
���x
=============== */

tolerance = 0

/*
[-4 - 24]
�傫������ƐF�X�Ȍ��o�����������ɂȂ�܂����A���̂Ԃ�딚��������̂łł��邾�� 0 ����
������Ȃ̂� 0 �ł܂Ƃ��Ɍ��o�o���Ȃ��ꍇ�A���邳�̃X�P�[�� (��q) �������Ă��Ȃ��\���������ł�
[�ڈ�] ������ 0 : ���掿�� H264 0 ���� 6 : �G���R���Ăׂɂ�p���čăG���R���ꂽ��� 10 �ȏ� (�炢)
*/

use_fast_color_search = False

/*
[True / False] 
True  : �F���o���A�o�E�g�ɍs��
False : �F���o�𕁒ʂɍs�� (�f�t�H���g)

True �ɂ���ƌ딚�����������܂��� FPS ���傫���オ��A�t���T�C�Y�̓���� 30fps �ōĐ����\�ɂȂ�܂�
���Ȃ肳�������ɂȂ�̂ōĐ��`�F�b�N������Ƃ��ƌ딚�̏��Ȃ��w�i�̎��ɂ͂������߂ł� (�Q�l�e�X�g��: Core i7) 
...���ꂪ False �ł����V�Ƃ��C�Ƃ��w�i�ł������딚�������Ȃ񂾂��ǃe�X�g���ĂȂ���ł���|����
*/

/* --------------------------------------------------------------------------------------
�J���[�X�P�[��
=============== */

full_scale_yuv_input = False

/*
[True / False] 
True  : ���͂� YUV �̎� �t���X�P�[���Ƃ��Ĉ���
False : ���͂� YUV �̎� TV �X�P�[���Ƃ��Ĉ��� (�f�t�H���g)

True �ɂ���Ɠ��͂��t���X�P�[�� (PC �X�P�[��) �� YUV �Ƃ݂Ȃ��Ĉ����܂�
AMV �R�[�f�b�N�̏o�͐ݒ�� "�X�P�[���␳�����Ȃ�" ��L���ɂ��Ă���ꍇ��
�Ӑ}�I�Ƀt���X�P�[���� YUV ����������ꍇ True �ɂ��ĉ����� (HD �����Q�[���^��ł͎��X����悤�ł�)
�X�P�[���������Ă��Ȃ��ꍇ�A���邳���ς�萳�������o�ł��܂���
(�S�̓I�ɔ��������荕�������肷�铮��Đ��Ɍo���͂Ȃ��ł��傤���H)

���͂� RGB �̏ꍇ�A���̃I�v�V�����͖�������܂��B
RGB �ɂ̓t���X�P�[���������݂��Ȃ����߁A�F�̖��ɂ��Ă悭�킩��Ȃ��ꍇ��
RGB �ł̏o�͗v�����󂯕t����R�[�f�b�N (AMV ��) �ŃG���R�[�h����������g���̂��m���ł�
*/

/* --------------------------------------------------------------------------------------
�o�̓t�H�[�}�b�g
=============== */

output_pixel_type = "auto"
full_scale_yuv_output = False

/*
[auto / RGB32 / YV12 / YV24 / YUY2 / ���̑��F�X]
auto �ɂ���Ɠ��͂��ꂽ�Ƃ��Ɠ����^�C�v�ŏo�͂��܂�
full_scale_yuv_output �� True ���o�͂� YUV �̏ꍇ�t���X�P�[���̂܂܏o�͂��܂�
�o�͂� RGB �̏ꍇ�X�P�[���͊֌W����܂��� (��Ƀt���X�P�[��)
full_scale_yuv_input �� True �� output_pixel_type �� auto �ł� 
full_scale_yuv_output �� True �ɂ��Ȃ��� YUV �ł̏o�͎��̓t���X�P�[���ɂȂ�܂���

���͂Əo�͂ɂ��Ă��ڂ����������K�v�ȏꍇ�̓X�N���v�g�̈�ԉ��ɗ]�v�Ȑ����������Ă���܂�
*/

/* --------------------------------------------------------------------------------------
�e�X�g�p�Ȃ�
=============== */

luma_threshold = 160 # �����������ƑS�Ă����܂��s���Ȃ��Ȃ�܂����Ԃ�
test = False
stack_test = False
disp_info = False

#-----------------------------------------------------------------------------------------------------------
source = loadMedia(movie, prefer_pixel_type, Float(fps))
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

# �g�b�v���x���̃��[�J���ϐ��ɂ��Ȃ��ƃ����^�C��������`���Ȃ��H ScriptClip �̑������̓���I�u�W�F�N�g�ɃX�R�[�v���t�����Ă�H
framerate_ratio = 30.0 / yv24r.framerate
letter_height = 20
wave_countdown_info_pos_x = int(wave_countdown_info_pos_x / 2)
wave_tol = tolerance + 8
wave_reward_info_height = 50
wave_prev_status = False
wave_reward_display_count = 0
wave_detection_thresh = 0
wave_fragment_limit = 100.0
wave_fragment_count = 0
wave_suspend_limit = 500.0
wave_suspend_count = wave_suspend_limit / 10
wave_title_flash = y8r.Crop(0, wave_title_pos - letter_height / 2, 16 * 10, letter_height)
wave_reward_info = yv24r.Crop(0, wave_reward_info_pos - letter_height / 2, 0, letter_height)
wave_countdown_info = yv24r.Crop(wave_countdown_info_pos_x, wave_countdown_info_pos_y, 16 * 6, letter_height) \
    .MaskHS(minSat=30, maxSat=100, startHue=Max(0, 290 - tolerance), endHue=Min(360, 305 + tolerance), coring=false)

header = Apply(use_fast_color_search ? "nameHeaderMaskYVFast" : "nameHeaderMaskYV", yv24ri, y8r, luma_threshold, tolerance)
findNameHeader(y8r, header, frame, tolerance, line_height)
Levels(0, mosaic_strength_2, Max(0, 255 - mosaic_strength_1), 0, 255, coring=false)
mt_logic(last, last.BlankClip(color=$FFFFFF).Letterbox(5, ui_height, 5, 5).mt_binarize(127), mode="and")

mosaic_mask = detect_wave_result ? findWaveEnd(y8r, last, wave_result_pos, wave_result_h, test) : last

ImageSource(ScriptDir + "\mask\" + ui_mask, use_DevIL=true, start=0, end=1, pixel_type="RGB32").ConvertToY8(matrix="PC.601").KillAudio
resizeUiMask(source, last, mode="auto").modulo(32).PointResize(yv24r.width, yv24r.height)
ui_mask = Loop(yv24r.framecount, 0, 0) # �ǂݍ��ݎ��Ƀt���[���𑝐݂���Ɣ��ɒx���Ȃ�̂� Loop �Ő���������

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
    BlankClip(y8, color=$000000).mt_binarize(127)

    ScriptClip("""
        result_mask = last
    
        wave_reward_info
        reward_displaying_now = ((wave_detection_thresh > 70 || wave_reward_display_count > 0) \
            && (YPlaneMedian > 40 - wave_tol) && (YPlaneMedian < 40 + wave_tol) \
                && (UPlaneMedian > 135 - wave_tol) && (UPlaneMedian < 135 + wave_tol) \
                    && (VPlaneMedian > 120 - wave_tol) && (VPlaneMedian < 120 + wave_tol)) ? \
                        True : False
        
        reward_display_end_now = (wave_prev_status && !reward_displaying_now && wave_reward_display_count > 50) ? True : False
        wave_prev_status = reward_displaying_now
        wave_reward_display_count = reward_displaying_now ? wave_reward_display_count + framerate_ratio : Max(0, wave_reward_display_count - framerate_ratio)
        wave_reward_display_count = reward_display_end_now ? 360 : wave_reward_display_count
        
        _thresh_increase = (((wave_title_flash.AverageLuma > 240) ? 20 : 0) + ((wave_countdown_info.AverageLuma > 70) ? 1 : 0)) * framerate_ratio
        wave_suspend_count = reward_display_end_now ? wave_suspend_limit : (_thresh_increase == 0) ? Max(0, wave_suspend_count - framerate_ratio) : wave_suspend_count
        wave_fragment_count = (wave_suspend_count == 0 && _thresh_increase > 0) ? wave_fragment_limit : Max(0, wave_fragment_count - framerate_ratio)
        wave_detection_thresh = (wave_fragment_count > 0) ? wave_detection_thresh + _thresh_increase : 0
        
        result_mask
        (wave_reward_display_count == 0 || reward_displaying_now) ? NOP : \
            (wave_reward_display_count > 355) ? ColorYUV(off_y=255 - int(wave_reward_display_count - 355) * 50) : \
                (wave_reward_display_count > 30) ? ColorYUV(off_y=255) : \
                    (wave_reward_display_count > 0) ? ColorYUV(off_y=int(wave_reward_display_count) * 9) : NOP
            
        # �����^�C���X�N���v�g�̍Ō�� last �𖾎��I�ɂ����Ă��������ŉ��̂������Ȃ�
        last
    """)
    
    Letterbox(wave_result_pos, height - wave_result_h - wave_result_pos, int(width / 4), int(width / 2))
    ColorYUV(levels="TV->PC")
    mt_logic(last, name_mask, mode="max")
    
    test ? ScriptClip("""
        Subtitle( \
        " display_count: " + String(wave_reward_display_count) + \
        "\n suspend: " + String(wave_suspend_count) + \
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
    
    # DirectShowSource �̎��s���ɂ̓G���[�����������ɋ�̃N���b�v���Ԃ���邱�Ƃ�����̂� framecount ������
    # ������ 0 �̓���𓊂���l�̂��Ƃ͍l�����Ȃ�
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
    
    return Invert.Invert # ���̂������Ȃ�
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

�ȉ��������ݓ������b
�����ł̓t���X�P�[���� YV24 �ŏ������Ă��܂�
���̂܂܏o�͂ł���Η򉻂��������ߗǂ��̂ł����A���̒��ɂ� YV24 ���󂯕t���Ȃ����ꂱ��������ł� (Aviutl �Ȃ�)

���̓��悪 UtVideo ���� YV12 �ȏ�̐��x�������Ă���ꍇ�A�o�͂� YV24 �ɂ��ăt���X�P�[���� YV24 �� 
x264 �ŃG���R�[�h����Ƃ����I���͑f�G�����ǂ��A�c�O�Ȃ��瑽���̍Đ����� YV24 �ɑΉ����Ă��܂���

AMV �R�[�f�b�N�� YV12 �ł��� RGB �ł̏o�͗v�����󂯕t���AYV12 �ŏo�͂����Ă������ŐL���������
RGB �ŏo�͂������ق������̂����m�ȐF���łĂ��܂� (�������t���X�P�[���H) �ׂ����ݒ�����Ă��炤�͖̂ʓ|���낤����
AMV �̃f�t�H���g�ݒ�ōł��X�P�[���̊ԈႢ���N���ɂ��� RGB �ł̓ǂݍ��݂�D�悵�Ă��܂�
���̂��߁A AMV �Ř^�悵�����̂��f�t�H���g�� auto �ŏo�͂���Ƃ����炭�o�͂� RGB �ɂȂ�܂�

��������ƍŏI�I�Ɉ�ʓI�� YV12 �ł̃G���R�[�h���s���ꍇ
(AMV ���� YV12 -> RGB) -> (���̃X�N���v�g�� YV24 -> RGB32) -> (VFW Aviutl etc) -> (�G���R�[�_�[)
�ƕϊ������݂ɍs�����ɂȂ��Ă��܂��܂�
���ꂪ�C�ɂȂ�ꍇ�A���̐ݒ�� YV12 �ɂ��� AMV �R�[�f�b�N�̃X�P�[���␳�̃`�F�b�N���O���A���͂� YV12 �t���X�P�[���ɂ��Ă���
���̓X�P�[���̐ݒ������ �o�͂� YV12 �t���X�P�[���ōs���̂��x�X�g�ɂȂ�܂��c ���A�߂�ǂ������ł���H
�����������ꏑ���Ă邾���ł߂�ǂ��������A��������Ă邩�킩���ĂȂ��Ɩ��邭�Ȃ�����Â��Ȃ����肷�邾���ɂȂ邵�����S�肪�Ȃ�����
�ԈႢ�̂Ȃ� RGB �o�R�ł����Ǝv��
�C�ɂȂ�l�͐������Ȃ��Ă����̕ӂ킩���Ă�l���낤���� (BT.701 ����Ȃ���₾�Ƃ�) �����ŃX�N���v�g���������ĉ�����

�v���O���~���O�̒m��������l��������
if else �̐���\���͂���܂���B�O�����Z�q�� Eval �œ��l�̎����\�ł��B���[�v������܂��񂪁A�ċA�œ������Ƃ��\�ł��B
last �͍Ō�ɕԂ��ꂽ����I�u�W�F�N�g�ł��B����ł� last ���X�V����܂���B
�t�B���^ (Avisynth �ł͓�����������\�b�h�̂��Ƃ��t�B���^�ƌ����܂�) �̑���������������Ă��Ȃ��ꍇ�Alast ���Öق̑������ɂȂ�܂��B
�h�b�g���g���ăC���{�J���g�����m�ȏꍇ�͓��R�ł������ꂪ�������ɂȂ�܂��B
�����̃N���b�v�� 2 �ȏ゠��ꍇ�A�ǐ��̂��߂� last ���������Ă��܂�������ȏ�̈Ӗ��͂���܂���B
�ϐ��ɂ̓��[�J���X�R�[�v�ƃO���[�o���X�R�[�v������܂��B�����^�C�����\�b�h�̒��̃��[�J���ϐ��̓g�b�v���x���̑f�̃��[�J���ϐ��Ɠ��������ɂȂ�܂�(����)
�ϐ��͑���������_�Ō^�����܂�܂��B
�����͑S�Ă̍\����͂��I��������ƂŁA���[����c���[��k���čŒZ�̌o�H�ɂȂ�悤�ɍs���܂�
