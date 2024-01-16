program Main
use texto
file8 = trim('./path.txt')
print*, file8
open (8,file = file8,status='old',action ='read',access='sequential')
read(8,*)!Path where you find the programs to calculate direct and adjoint models
read(8,801) path_HID_direct! = '../MD_HID_Directo'
read(8,801) path_ELC_adjunto! = '../MD_ELEC_Dir_ADJ' !calcula el modelo directo y adjunto
read(8,801) path_HID_dir_ADJ_E! = '../MD_HID_Dir_ADJ_E' !calcula adjunto con contribución de información electrica |
read(8,*)!Path where you find the programs to calculate data sensitivity to saturated electrical and hydraulic parameters
read(8,801) path_DV_perm! = '../DV_perm'
read(8,801) path_DV_elec! = '../DV_elec'
read(8,*) !path where it finds the input files
read(8,801) path_Sint1MI_H! = '../ModeloSinteticoNF/Mod_ini/Mod_ini_Hid/' !modelo inicial hidraulica 
read(8,801) path_Sint1MI_E! = '../ModeloSinteticoNF/Mod_ini/Mod_ini_Elc/' !modelo inicial electrica 
read(8,801) path_Sint1_eval_PHI! = '../ModeloSinteticoNF/Eval_PHI/' !Archivo donde se guarda el misfit
read(8,801) path_Sint1_lee_DER! = '../ModeloSinteticoNF/Mod_ini/'
801 format(A50)
close (8)
call call_routines() 

end program

!**********************************************************************************
subroutine call_routines()
use texto
	print*,'***************************************************************************'
	print*,''
	print*,'Routine to calculate the direct hydraulic model'
call system(path_HID_direct)
	print*,'I exit the routine to calculate the direct hydraulic model'
	print*,'', path_HID_direct
	print*,''
	print*,'***************************************************************************'
	print*,'***************************************************************************'
	print*,''
	print*,'Routine to calculate the direct electric and adjoin electric model'
call system(path_ELC_adjunto)
	print*,'I exit the routine to calculate the direct hydraulic model'
	print*,'', path_ELC_adjunto
	print*,''
	print*,'***************************************************************************'
	print*,'***************************************************************************'
	print*,''
	print*,'Routine to calculate the adjoint hydraulic model'
call system(path_HID_dir_ADJ_E)
	print*,'I exit the routine to calculate the adjoint hydraulic model'
	print*,'', path_HID_dir_ADJ_E
	print*,''
	print*,'***************************************************************************'
	print*,'***************************************************************************'
	print*,''
	print*,'Routine to calculate Data sensitivity to hydraulic permeability'
call system(path_DV_perm)
	print*,'I exit the routine to calculate Data sensitivity to hydraulic permeability'
	print*,'',path_DV_perm
	print*,''
	print*,'***************************************************************************'
	print*,'***************************************************************************'
	print*,''
	print*,'Routine to calculate data sensitivity to saturated electrical conductivity'
call system(path_DV_elec)
	print*,'I exit the routine to calculate data sensitivity to saturated electrical conductivity'
	print*,'', path_DV_elec
	print*,''
	print*,'***************************************************************************'
	print*,'***************************************************************************'
	print*,''
	print*,'The derivatives have already been calculated '

return
end