   M S B A M L   `   `   `  ����  AdminApp    AdminApp.MainWindow   5   	   W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  Admin Panel��5   	   $	��450��5   	   $	��800��6    � WindowStyle$
 None=�5   	    � AllowsTransparency$
 True��5   	   ���	#FFFAFAFA � 
ResizeMode$ CanResizeWithGrip=�5	   	   .��5
      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� ���	#FF007ACC$��0��6(   $��30��65   ._�5      ]� .+�5      �� $3��-Административная панель��6   $��20(�5      $
��Bold"�5      $��9 0 0 0q�5      
������� J� RenderTransformOrigin$ 0.502,-0.111&�5   /   $��87��6T   $	��701��6`   � 5      $
��Auto��6   $��30��6$    � ColumnDefinitions 5      �� 5      $��* �6+   �� 5      $
��Auto �6+   �� 5       $
��Auto �6+   �� 5!      $
��Auto �6+    5#      �� 5$      $��* �6(   .+�5(      �� -   5        $��-��5(      $��30��6)   $��30��64   ���	#FF007ACC
�������$��1��6�   ��6n   Z� 6�   �� 5+      -   5        $	��⧉��5+      $��30��6)   $��30��64   ���	#FF007ACC
�������$��2��6�   ��6u   Z� 6�   �� 5.      -   5        $��X��5.      $��30��6)   $��30��64   ���	#FF007ACC
�������$��3��6�   ��6k   Z� 6�   5/      50      51      &   System.Windows.Controls.DataGrid  54   
   $��1��6      AutoGenerateColumns$ False��56         
IsReadOnly$
 True��58      $��10q�59      "	   VerticalScrollBarVisibility$
	 Auto=�5:      
����������	#FF007ACC$��1q�5=      ��55      �� *	Clients+
 �� SelectedItem
 57      �� *SelectedClient+   Columns 5>      0  *System.Windows.Controls.DataGridTextColumn  5?      ,  &System.Windows.Controls.DataGridColumn   Header$ ФИО��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 62   �� *
FullName+  5@      $ 
Адрес��6%    64   �� *	Address+  5A      $ Год рождения��6%    6;   �� *YearOfBirth+  5B      $ ЕГРН��6%    63   �� *EGRN+  5C      $ Статус��6%    65   �� *Status+5E      �� 5H   
   $��2��6    �� Orientation$ 
Horizontal=�6"   $��Center=�6;   $��0,0,0,20q�6X   $ 	0.5,0.538&�6j   .+�5I      �� 
���  ��$��0,0,0,10q�5K       �� TextAlignment$ Center=�5L      $��16(�5M      ��5I      �� *StatusMessage+ J� Effect 5N      3  -System.Windows.Media.Effects.DropShadowEffect  5O         ShadowDepth$ 2Q�6'      Color$
 Gray��67      
BlurRadius$ 5Q�6D   5Q      �� 5R      $��Принять��6   $	��100��6'   $��5q�63   ���	#FF007ACC
���������6>   �� *ConfirmCommand+��6�   Z� �� 5S      $��Отклонить��6   $	��100��6)   $��5q�65   ���	#FF007ACC
���������6@   �� *RejectCommand+��6�   Z� 5T      5U      5V      