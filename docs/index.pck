GDPC                                                                               <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stexpD      U      -��`�0��x�5�[   res://Controller.gd.remap   @V      %       c��p���p����   res://Controller.gdc�      �      ^hpa���)'sS[J�   res://Level.gd.remappV              	���3PHXW�q��w<   res://Level.gdc        �      ����^� 9%���lɩ   res://Level.tscn�	      �      ɓ�E��
\3}N�K0=   res://Menu.gd.remap �V             ��U���5Yp�Z��gh   res://Menu.gdc  p      A      _��OLu�(o�M���_   res://Menu.tscn �      �      ؓDkx�@y�|V��rλ   res://Player.gd.remap   �V      !       ��0�F �qq��dX��   res://Player.gdcP      M      �b]k�2�9�5�TI   res://Player.tscn   �      �      ���ٵ�S�{x��(   res://WebSocketClientWrapper.gd.remap   �V      1       
`d�H5� Y$����    res://WebSocketClientWrapper.gdc�!      0      M�I�Ŗ�ڿ&\M�EO@   res://addons/open-external-editor/open_external_editor.gd.remap  W      K       �.��ۦ��%�	,X<   res://addons/open-external-editor/open_external_editor.gdc  �.      �      �?w?Z�����`7lC   res://default_env.tres  �C      �       um�`�N��<*ỳ�8   res://icon.png  pW      �      G1?��z�c��vN��   res://icon.png.import   �Q      �      �����%��(#AB�   res://project.binary`d      �      ��&ٿ�������֧   res://webrtc/webrtc.tresPT      �      �^�bxpV�!��~��    GDSC            Z      ���Ӷ���   �������¶���   ��������   �������Ŷ���   �����׶�   ����������������Ķ��   ζ��   ����¶��   ������������������޶   ϶��   ���������Ҷ�   �������������Ӷ�   �����������¶���   ����      ui_right      ui_left       ui_down       ui_up         set_movement                   
                              +   	   =   
   C      J      K      L      T      X      3YY;�  �  T�  YYY0�  P�  QV�  &�  PQV�  �  T�  �  T�  PQ�  T�  P�  Q�  �  T�	  �  T�  P�  Q�  T�  P�  Q�  �  T�
  PQ�  �  P�  R�  QYYYH0�  P�  QV�  �  �  Y`              GDSC   	         B      ���ӄ�   �����϶�   �������Ӷ���   ����������������Ķ��   �����Ą�   ���������Ķ�   �����������������Ķ�   ��������������������������Ŷ   ��������������������Ҷ��                                       
                  *      -   	   .   
   @      3YYY0�  PQV�  &�  PQT�  PQV�  �  W�  �  T�  P�  PQT�  PQLMR�  Q�  (V�  �  W�  �  T�  P�  PQT�  PQR�  QY`               [gd_scene load_steps=3 format=2]

[ext_resource path="res://Player.tscn" type="PackedScene" id=1]
[ext_resource path="res://Level.gd" type="Script" id=2]

[node name="Level" type="Node2D"]
script = ExtResource( 2 )

[node name="Player" parent="." instance=ExtResource( 1 )]
position = Vector2( 130, 90 )

[node name="Player2" parent="." instance=ExtResource( 1 )]
position = Vector2( 737, 88 )
      GDSC   5      b   <     ������ڶ   �������������嶶   �����������   ��������   ��������������Ķ   ����������������Ķ��   ����   �����϶�   ���������������������Ķ�   ������¶   ���������ٶ�   �������Ŷ���   �����׶�   ���ڶ���   ������������Ҷ��   �Ҷ�   ���������Ӷ�   �������Ӷ���   ���������������Ķ���   �����������������Ҷ�   ������������Ҷ��   ���Ķ���   �������������������ض���   �������Ķ���    ������������������������������Ҷ   ���Ӷ���   ��ƶ   �������Ķ���   ���������ض�   ��������������������ض��   ���������Ķ�   ����������Ķ   ���������������������Ҷ�   �����������Ķ���   �����������������Ҷ�   ����Ķ��   ���������������������ض�   ������������������Ҷ   �����Ķ�   ��������������������Ҷ��   �������Ӷ���   ���������Ӷ�   �������Ӷ���   ����������������Ӷ��   ������������������������Ҷ��   �������������Ӷ�   ���������������������Ҷ�   �����������Ӷ���   ���������Ӷ�   �����������������������Ҷ���   ����������������¶��   ��������Ŷ��   ����������������Ķ��   &   ws://guarded-oasis-16598.herokuapp.com     
   iceServers        urls      stun:stun.l.google.com:19302      res://Level.tscn   	   connected         _on_connected         peer_connected        _on_peer_connected        server_id_recieved        _on_server_id_recieved        offer_recieved        _on_offer_recieved        answer_recieved       _on_answer_recieved       candiate_recieved         _on_candiate_recieved         _on_rtc_peer_connected        connection_succeeded      _on_connection_succeeded            My ID:        session_description_created       _on_session_description_created       ice_candidate_created         _on_ice_candidate_created         Peer added:       offer         answer        peer connected:                          	                         )   	   *   
   +      1      2      =      >      I      J      U      V      a      b      m      n      y      z      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0     1     2     3     4   '  5   (  6   )  7   4  8   D  9   H  :   S  ;   ^  <   _  =   `  >   g  ?   q  @   s  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U     V     W     X     Y     Z     [     \     ]     ^      _   &  `   /  a   :  b   3YYY:�  Y:�  N�  VLN�  VL�  MOMOY:�  �  YY;�  �  T�  PQYYY0�  PQVY�  �  T�	  P�  RR�  QY�  �  T�	  P�  RR�  QY�  �  T�	  P�	  RR�
  QY�  �  T�	  P�  RR�  QY�  �  T�	  P�  RR�  QY�  �  T�	  P�  RR�  Q�  �  �  T�	  P�  RR�  Q�  �  T�	  P�  RR�  Q�  �  �  T�
  P�  Q�  �  Y0�  P�  QV�  �  T�  PQYYY0�  P�  QV�  �  T�  P�  R�  Q�  �  PQT�  P�  Q�  �?  P�  �>  P�  QQYYY0�  P�  QV�  &�  �  T�  PQV�  .�  ;�  V�  �  T�  PQY�  �  T�  P�  QY�  �  T�	  P�  RR�  RL�  MQY�  �  T�	  P�  RR�  RL�  MQ�  �  T�  P�  R�  Q�  �?  P�  �>  P�  QQYYY0�  P�  R�  R�  QV�  �  T�  P�  QT�  T�  P�  R�  Q�  /�  V�  �  V�  T�  P�  R�  Q�  �  V�  T�  P�  R�  QYYY0�   P�  QV�  &�  �  T�  PQV�  .�  �  T�  P�  QT�  T�!  PQYYY0�"  P�  R�#  QV�  �  T�  P�  QT�  T�$  P�  R�#  Q�  �  Y0�%  P�  R�&  QV�  �  T�  P�  QT�  T�$  P�  R�&  Q�  �  Y0�'  P�  R�(  R�)  R�*  QV�  �  T�  P�  QT�  T�+  P�(  R�)  R�*  Q�  YY0�,  P�(  R�)  R�*  R�  QV�  �  T�-  P�  R�(  R�)  R�*  Q�  �  Y0�.  P�  QV�  �?  P�  R�  QY�  �  PQT�/  P�  Q�  �0  PQ�  �  Y0�1  PQV�  �?  P�  QYYY0�2  PQV�  �?  P�  T�3  PQQ�  �?  P�  PQT�4  PQQY`               [gd_scene load_steps=2 format=2]

[ext_resource path="res://Menu.gd" type="Script" id=1]

[node name="Menu" type="Control"]
anchor_right = 1.0
anchor_bottom = 1.0
script = ExtResource( 1 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Timer" type="Timer" parent="."]
wait_time = 10.0
autostart = true
[connection signal="timeout" from="Timer" to="." method="_on_Timer_timeout"]
            GDSC            r      ������������τ�   ��������󶶶   ����򶶶   ����������Ķ   ���������Ķ�   ���������Ķ�   ����ض��   ����ض��   ���������������Ŷ���   ����׶��   �������������Ӷ�   �������¶���   ����������������Ķ��   �������������Ӷ�   �������ض���   �����������ض���   ��Ŷ   �������������������϶���                         set_position      position                          
                                 	      
   &      '      (      /      0      9      :      @      D      L      P      W      X      Y      a      p      3YY:�  YY8;�  �  YY;�  �  YY5;�  W�  Y5;�  W�  YYY0�  P�	  QVY�  �
  P�  T�  �  Q�  �  &�  PQV�  �  �	  �  &P�  �  QV�  �  �  �  �  P�  R�  QYYYH0�  P�  QV�  �  T�  PR�  R�  R�  R�  QY`   [gd_scene load_steps=3 format=2]

[ext_resource path="res://Player.gd" type="Script" id=1]
[ext_resource path="res://Controller.gd" type="Script" id=2]

[node name="Player" type="KinematicBody2D"]
script = ExtResource( 1 )
SPEED = 200

[node name="ColorRect" type="ColorRect" parent="."]
margin_right = 40.0
margin_bottom = 40.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Controller" type="Node" parent="."]
script = ExtResource( 2 )

[node name="Tween" type="Tween" parent="."]
    GDSC   >      V   $     ���Ӷ���   ��������Ҷ��   �Ҷ�   �������������Ҷ�   �����������������Ҷ�   �������������Ҷ�   ����Ķ��   ��������������Ҷ   �����Ķ�   ����������������Ҷ��   �������Ӷ���   ���������Ӷ�   �������Ӷ���   �������嶶��   �����¶�   ��������������¶   ����   �����϶�   ������¶   �������Ŷ���   �����׶�   �����Ŷ�   ��������������������Ŷ��   ��������������������񶶶   �������������������򶶶�   ���ڶ���   ���������ٶ�   ��ڶ   �������������ڶ�   ���������Ķ�   ��ƶ   ������������Ӷ��   ����䶶�   ����������Ķ   �����䶶   �������������Ӷ�   ��������󶶶   �����Ķ�   ������Ҷ   �������Ķ���   ���������¶�   ����������Ѷ   �����Ў�   ���Ӷ���   ��������   �������������������������Ҷ�   ��������ڶ��   �����������������¶�   �������������Ӷ�   ������������Ķ��   ���������������   ����������������Ҷ��   �������������Ӷ�   ����Ӷ��   ���������¶�   ������������������Ў����   �����¶�   ������Ӷ   ��   ����������ڶ   ���䶶��   �����䶶      ID        PEER      SERVER        OFFER         ANSWER     	   CANDIDATE         connection_established        _on_connection_established        data_received         _on_data_received               type      id        payload    	   connected         peer_connected        server_id_recieved        offer_recieved               answer_recieved       candiate_recieved                            	                        %      1   	   2   
   7      <      A      F      K      P      U      W      X      a      b      c      i      t            �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .     /     0     1     2   .  3   /  4   0  5   A  6   H  7   M  8   R  9   V  :   Y  ;   Z  <   [  =   b  >   k  ?   y  @   z  A   {  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T     U   "  V   3YYB�  P�  QYB�  P�  QYB�  P�  QYB�  P�  R�  QYB�  P�  R�  QYB�	  P�  R�
  R�  R�  QYY:�  N�  VR�  �  V�  R�  �  V�  R�  �  V�  R�  �  V�  R�  �  V�  RYOYY;�  �  T�  PQYYY0�  PQV�  �  T�  P�  RR�  Q�  �  T�  P�  RR�	  QYYY0�  P�  QV�  ;�  �  T�  PQ�  &�  �  T�  �  �  T�  V�  �  T�  PQYYY0�  P�  QV�  �  T�  P�  QYYY0�  P�  R�  QV�  �  P�  T�   R�  RL�  MQYYY0�!  P�  R�  QV�  �  P�  T�"  R�  RL�  MQYYY0�#  P�  R�
  R�  R�  QV�  �  P�  T�$  R�  RL�
  R�  R�  MQYYY0�  P�%  R�  R�&  V�  LMQV�  �  T�'  P�
  QT�(  P�)  P�%  R�  R�&  QT�*  PQQYYY70�)  P�+  R�  R�&  V�  LMQV�  .�,  T�?  PN�  �  V�+  R�  �  V�  R�  �  V�&  �  OQYYY0�-  P�.  QV�  �?  P�  T�/  PQQ�  �  T�'  P�
  QT�0  P�1  T�2  QYYY0�3  PQV�  �4  P�,  T�5  P�  �  T�'  P�
  QT�6  PQT�7  PQ�  QT�8  QYYY0�4  P�9  QV�  /�9  T�+  V�  �  T�:  V�  �;  P�  R�9  T�  Q�  �  T�<  V�  �;  P�  R�9  T�  Q�  �  T�=  V�  �;  P�  R�9  T�  Q�  �  T�   V�  �;  P�  R�9  T�  R�9  T�&  L�  MQ�  �  T�"  V�  �;  P�  R�9  T�  R�9  T�&  L�  MQ�  �  T�$  V�  �;  P�  R�9  T�  R�9  T�&  L�  MR�9  T�&  L�
  MR�9  T�&  L�  MQY`GDSC   _      �   V     �����������ض���   ����������������󶶶   ����󶶶   �����������������嶶   ����������������   ���������������������������   ����������������񶶶   ������������������   ������������ض��   ������������Ķ��   ��������������Ŷ   �����ض�   �������¶���   ����������Ӷ   �����Ӷ�   ���������������ٶ���   �������������������Ӷ���   ����������������Ķ��   ������������������Ŷ   ����������¶   ������������϶��   ����   �������Ӷ���   �����������ⶶ��   ��¶   �����������򶶶�   ������Ҷ   ������ڶ   ����������������   ���׶���   �������������ⶶ   ����¶��   �������¶���   �����������¶���   ���������ض�   ���¶���   �����������ƶ���   ����������¶   ������¶   ���·���   ��������Ҷ��   ���·���   ��������Ҷ��   ���������Ӷ�   ���Ӷ���   �����¶�   ����¶��   ����������¶   ������Ҷ   �����������������Ӷ�   �������������������Ķ���   ������������������Ķ   ����������Ѷ   ��������޶��   ���������Ŷ�   ���Ŷ���   ���������������Ŷ���   �嶶   ������Ӷ   ������������¶��   ������   ����������   �������������¶�   �����������������¶�   �����������Ŷ���   ���������������Ŷ���   ߶��   ����Ҷ��   �����������ض���   ��������Ŷ��   �����Ķ�   ���Ӷ���   ����Ŷ��   ��������¶��   �����¶�   �����������޶���   ��������������Ŷ   �������������޶�   ����������޶   ������������޶��   ����϶��   ���Ӷ���   ��������������Ӷ   �����ض�   ����������������ض��   �������ض���   ����������Ŷ   ������Ӷ   ���۶���   ��������Ŷ��   ������������Ŷ��   �����޶�   ��Ѷ   �����Ķ�   ��������ݶ��   (   text_editor/external/use_external_editor      text_editor/external/exec_path        text_editor/external/exec_flags       major            :   "Open External Editor" plugin requires Godot 3.0 or higher              Ext. Editor        Open script in external editor (      )         pressed       open_external_editor                              ScriptTextEditor      minor         TextEdit      Couldn't get TextEdit node        res://        {line}        {col}         \\        \                	   {project}         {file}        "                                                 	      
   	      
                                                                                    #      $      )      .      3      4      7       8   !   ;   "   >   #   A   $   D   %   E   &   K   '   S   (   \   )   a   *   c   +   m   ,   w   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6   �   7   �   8   �   9   �   :   �   ;   �   <   �   =   �   >   �   ?     @     A     B     C     D      E   &  F   '  G   .  H   B  I   F  J   G  K   M  L   W  M   a  N   k  O   o  P   q  Q   y  R     S   �  T   �  U   �  V   �  W   �  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d     e     f     g     h      i   $  j   %  k   ,  l   3  m   9  n   >  o   @  p   I  q   O  r   Q  s   [  t   g  u   o  v   q  w   |  x   �  y   �  z   �  {   �  |   �  }   �  ~   �     �  �   �  �   �  �   �  �   	  �     �     �   !  �   %  �   <  �   A  �   E  �   J  �   M  �   Q  �   T  �   YYYYYYYYYYYYYYYYYYYY6Y3YY:�  �  Y:�  �  YY:�  Y:�  �  Y:�  �  YY;�  YY;�	  Y;�
  Y;�  Y;�  YY0�  PQV�  �  �  T�  PQ�  &�  L�  M	�  V�  �?  P�  Q�  .�  �	  �  PQT�  PQ�  �
  �  PQT�  PQ�  ;�  �  T�  PQ�  �  T�  �  �  &�  "�  V�  �  T�  �  �  &�  "�  V�  �  T�  �  �  &�  "�  V�  �  T�  �  �  &�  "�  V�  �  T�  �  �  &�  "�  V�  �  T�  �  �  �  �   T�  PQ�  �  T�!  P�  Q�  �  �"  T�  PQ�  �  T�#  �  �  �  T�$  �  �  T�%  PQ�	  �  �  T�&  P�
  RR�  Q�  ;�'  �	  T�(  P�  Q�  ;�)  �'  T�(  P�  Q�  �)  T�*  P�  QYY0�+  PQV�  &�  �  V�  �  T�,  PQYY0�-  P�.  QV�  &�  T�/  P�.  Q�.  T�0  �	  T�1  PQV�  �2  PQYY0�2  PQV�  ;�3  �
  T�4  P�  Q�  ;�5  �
  T�4  P�  Q�  ;�6  �
  T�4  P�  Q�  &�3  V�  .�  ;�7  �8  P�6  Q�  &�7  �  V�  .�  �9  T�:  P�5  R�7  R�  QYYY0�;  PQV�  ;�'  �	  T�(  P�  Q�  ;�<  �'  T�(  P�  Q�  ;�=  �<  T�(  P�  Q�  ;�>  �	  T�?  PQ�  ;�@  �	  T�A  PQ�  ;�B  �  �  )�C  �=  T�D  PQV�  &�C  T�E  PQ�  V�  ,�  &�>  �@  L�B  MV�  ;�F  �C  T�(  P�  Q�  &�  L�  M�  V�  .�F  T�(  P�  Q�  (V�  )�C  �F  T�(  P�  QT�D  PQV�  &�C  T�G  �  V�  .�C  �  �B  �  YY0�8  P�H  QV�  ;�I  �;  PQ�  &�I  �  V�  �B  P�  Q�  .�  ;�J  �	  T�?  PQ�  &�J  �  V�  .�  ;�K  �L  T�M  P�  Q�  ;�N  �L  T�M  P�J  T�O  Q�  &�N  T�P  PQV�  .�  ;�Q  �I  T�R  PQ�  �  ;�S  �I  T�T  PQ�  �  �H  �H  T�U  P�  R�>  P�3  P�  R�Q  QQQ�  �H  �H  T�U  P�  R�>  P�S  QQ�  �H  �H  T�V  PQT�W  P�  R�  Q�  ;�7  �  PQ�  ;�X  �  �  ;�Y  �  �  ;�Z  �  �  )�B  �K  P�H  T�[  PQ�  QV�  &�B  �H  T�[  PQP�Z  �H  L�B  M�  QV�  ;�\  �H  T�]  P�X  R�Y  Q�  �\  �\  T�U  P�  R�K  Q�  �\  �\  T�U  P�  R�N  Q�  �7  T�^  P�\  Q�  �X  �B  �  �  �Y  �  �  '�H  L�B  M�  P�B  �H  L�B  �  M�  QV�  &�Z  V�  �X  �  �  �Z  �Z  �  (V�  �Y  �  �  .�7  Y`             [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[gd_resource type="GDNativeLibrary" format=2]

[resource]
singleton = true
reloadable = false
entry/Windows.64 = "res://webrtc/lib/webrtc_native.windows.release.64.dll"
entry/Windows.32 = "res://webrtc/lib/webrtc_native.windows.release.32.dll"
entry/X11.64 = "res://webrtc/lib/libwebrtc_native.linux.release.64.so"
entry/X11.32 = "res://webrtc/lib/libwebrtc_native.linux.release.32.so"
dependency/Windows.64 = [  ]
dependency/Windows.32 = [  ]
dependency/X11.64 = [  ]
dependency/X11.32 = [  ]
  [remap]

path="res://Controller.gdc"
           [remap]

path="res://Level.gdc"
[remap]

path="res://Menu.gdc"
 [remap]

path="res://Player.gdc"
               [remap]

path="res://WebSocketClientWrapper.gdc"
               [remap]

path="res://addons/open-external-editor/open_external_editor.gdc"
     �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         Network-test-webrtc    application/run/main_scene         res://Menu.tscn    application/config/icon         res://icon.png     autoload/WebSocketClientWrapper(          *res://WebSocketClientWrapper.gd   editor_plugins/enabled$            open-external-editor       gdnative/singletons(               res://webrtc/webrtc.tres$   rendering/quality/driver/driver_name         GLES2   %   rendering/vram_compression/import_etc         &   rendering/vram_compression/import_etc2          )   rendering/environment/default_environment          res://default_env.tres  