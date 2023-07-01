#!/bin/bash
clear
echo "\n\n"
echo "\t              ====            =======          ====        ====    ==         =="
echo "\t             ==  ==           ==      ==       == ==      == ==     ==       =="
echo "\t            ==    ==          ==        ==     ==  ==    ==  ==      ==     =="
echo "\t           ==      ==         ==         ==    ==   ==  ==   ==       ==   =="
echo "\t          ==        ==        ==         ==    ==    ====    ==        == =="
echo "\t         == ======== ==       ==         ==    ==            ==         ==="
echo "\t        == ========== ==      ==         ==    ==            ==        ===="
echo "\t       ==              ==     ==        ==     ==            ==      ==   =="
echo "\t      ==                ==    ==       ==      ==            ==     ==     =="
echo "\t     ==                  ==   ==      ==       ==            ==             =="
echo "\t    ==                    ==  =======          ==            ==              =="
echo "\t                                                                              =="
echo "\t  ==============================================================================="
echo "\t  ================================================================================"
echo
echo "\t\t\t ┌─────────────────────────────────────────────┐"
echo "\t\t\t │       Cargando sistema ..............       │"
echo "\t\t\t └─────────────────────────────────────────────┘"
sleep 3
clear
mkdir /tmp/admx
mkdir /tmp/admx/user
mkdir /tmp/admx/admin
mkdir /tmp/admx/usuarios
mkdir /tmp/admx/activo

a=0
until [ $a -eq 2 ];do

cd /tmp/admx/admin
if [ -f administrador ] && [ -f contrasenia ];then

clear
echo "\t\t\t\t ┌────────────────────────────────────────┐"
echo "\t\t\t\t │  1)Iniciar sesión │ 0)Cerrar software  │"
echo "\t\t\t\t └────────────────────────────────────────┘"
echo -n "\t\t\t\t Ingrese una opción: "
read op4

case $op4 in

###################### Iniciar sesión
1)
	inicio=0
	until [ $inicio -eq 1 ];do
	clear
	echo
	echo -n "\n\t\t\t\t Ingrese usuario: "
	read user
	echo -n "\n\t\t\t\t Ingrese su contraseña: "
	stty -echo
	read cont
	echo
	stty echo

	cd /tmp/admx/admin
	adm=$( grep $user administrador )
	padm=$( grep $cont contrasenia )
	if [ $adm = $user ] && [ $padm = $cont ];then

###############################################################################################
				#Iniciando como administrador

			clear
			echo "\t\t\t\t ==============================="
			echo "\t\t\t\t\t  Bienvenido "$user 
			echo "\t\t\t\t ==============================="
			inicio=$(( $inicio + 1))
			sleep 2	
			b=0
			until [ $b -eq 1 ];do
			clear
			echo "\t\t\t\t ┌──────────────────────────────────────────┐"
			echo "\t\t\t\t │             Menú principal               │"
			echo "\t\t\t\t │==========================================│"
			echo "\t\t\t\t │1)Agregar usuario                         │"
			echo "\t\t\t\t │2)Editar usuario                          │"
			echo "\t\t\t\t │3)Remover usuario                         │"
			echo "\t\t\t\t │4)Mostrar usuarios                        │"
			echo "\t\t\t\t │5)Elimnar segmentos de memoria compartida │"
			echo "\t\t\t\t │6)Ver usuarios activos                    │"
			echo "\t\t\t\t │0)Cerrar sesión                           │"
			echo "\t\t\t\t └──────────────────────────────────────────┘\n"
			echo -n "\t\t\t\t  Eliga una opción: "
			read op
					#Menú principal

		case $op in

############################################### Opción agregar
		1)
			ge=0
			until [ $ge -eq 1 ];do 
	
			clear
			echo -n "\n\t\t\t\t Ingrese el nombre del nuevo usuario: "
			read nom

			cd /tmp/admx/user
			if [ ! -f $nom ];then

			echo -n "\n\t\t\t\t Ingrese la contraseña: "
			stty -echo
			read key1
			echo

			echo -n "\n\t\t\t\t Ingrese de nuevo la contraseña: "
			stty -echo
			read key2
			echo
			stty echo

				if [ $key1 = $key2 ];then

					clear
					echo "\n\t\t\t\t ╔═════════════════════╗"
					echo "  \t\t\t\t ║                     ║"
					echo "  \t\t\t\t ║   Creando usuario   ║"
					echo "  \t\t\t\t ║                     ║"
					echo "  \t\t\t\t ╚═════════════════════╝"
					echo $key1 >> /tmp/admx/user/$nom
					mkdir /tmp/admx/usuarios/$nom
					mkdir /tmp/admx/usuarios/$nom/Documentos
					sleep 2
					clear
					ge=$(( $ge +1 ))
					echo "\n\t\t\t\t ╔════════════════════╗"
					echo "  \t\t\t\t ║                    ║"
					echo "  \t\t\t\t ║   Usuario creado   ║"
					echo "  \t\t\t\t ║                    ║"
					echo "  \t\t\t\t ╚════════════════════╝"
					sleep 2
					echo

				else 
					clear
					echo "\n\t\t\t\t ......................................................."
					echo "  \t\t\t\t .                                                     ."
					echo "  \t\t\t\t .   Las contrasñas no coinciden ingreselo de vuelta   ."
					echo "  \t\t\t\t .                                                     ."
					echo "  \t\t\t\t ......................................................."
					sleep 2
				fi

			else
				clear
				echo "\n\t\t\t\t ............................"
				echo "  \t\t\t\t .                          ."
				echo "  \t\t\t\t .   El usuario ya existe   ."
				echo "  \t\t\t\t .                          ."
				echo "  \t\t\t\t ............................"
				sleep 2
			fi
			done
		;;

############################################## Opción editar
		2)
			mc=0
			until [ $mc -eq 1 ];do

			clear
			echo -n "\n\t\t\t\t Ingrese el usuario a editar: "
			read ed
			echo

			cd /tmp/admx/user
			hj=$( find $ed )
		if [ $hj = $ed ];then

			clear
			echo "\n\t\t\t\t ┌──────────────────────────────────────────┐"
			echo "  \t\t\t\t │  1)Cambiar nombre │ 2)Cambiar contraseña │"
			echo "  \t\t\t\t └──────────────────────────────────────────┘"
			echo -n "\t\t\t\t Ingrese una opción: "
			read oped

		case $oped in 
			1)
########### Cambio nombre
				clear
				echo -n "\n\t\t\t\t Ingrese el nuevo nombre de usuario: "
				read med
				cd /tmp/admx/user
				mv $ed $med
				clear
				mc=$(( $mc +1 ))
				echo "\n\t\t\t\t ╔════════════════════════════════╗"
				echo "  \t\t\t\t ║                                ║"
				echo "  \t\t\t\t ║   Nombre de usuario cambiado   ║"
				echo "  \t\t\t\t ║                                ║"
				echo "  \t\t\t\t ╚════════════════════════════════╝"
				sleep 2
			;;

			2)
############ cambio contraseña
					nume=0
					until [ $nume = 1 ];do
					clear
					echo -n "\n\t\t\t\t Ingrese la nueva contraseña: "
					stty -echo
					read npw 
					echo -n "\n\n\t\t\t\t Ingrese de vuelta la nueva contraseña: "
					read npw1
					echo
					stty echo

				if [ $npw = $npw1 ];then
					nume=$(( $nume + 1 ))
					echo $npw > /tmp/admx/user/$ed
					clear
					mc=$(( $mc +1 ))
					echo "\n\t\t\t\t ╔═════════════════════════╗"
					echo "  \t\t\t\t ║                         ║"
					echo "  \t\t\t\t ║   Contraseña cambiada   ║"
					echo "  \t\t\t\t ║                         ║"
					echo "  \t\t\t\t ╚═════════════════════════╝"
					sleep 2

				else
					clear
					echo "\n\t\t\t\t ...................................."
					echo "  \t\t\t\t .                                  ."
					echo "  \t\t\t\t .   Las contraseñas no coinciden   ."
					echo "  \t\t\t\t .                                  ."
					echo "  \t\t\t\t ...................................."
					sleep 2

				fi
				done
			;;
			esac

		else 
			clear
			echo "\n\t\t\t\t ............................"
			echo "  \t\t\t\t .                          ."
			echo "  \t\t\t\t .   El usuario no existe   ."
			echo "  \t\t\t\t .                          ."			
			echo "  \t\t\t\t ............................"
			sleep 2
		fi
		done

		;;

############################################## Opción eliminar
		3)
			ty=0
			until [ $ty -eq 1 ];do

			clear
			echo -n "\n\t\t\t\t Ingrese el usuario a eliminar: "
			read el

			cd /tmp/admx/user
			hy=$( find $el )

			if [ $hy = $el ];then

				echo -n "\n\t\t\t\t ¿Seguro que quieres eliminar el usuario?(s/n): "
				read sn
				if [ $sn = s ] || [ $sn = S ];then

					clear
					echo "\n\t\t\t\t ╔════════════════════════╗"
					echo "  \t\t\t\t ║                        ║"
					echo "  \t\t\t\t ║   Eliminando usuario   ║"
					echo "  \t\t\t\t ║                        ║"
					echo "  \t\t\t\t ╚════════════════════════╝"
					sleep 2
					rm /tmp/admx/user/$el
					rm -rf /tmp/admx/usuarios/$el
					clear
					echo "\n\t\t\t\t ╔═══════════════════════╗"
					echo "  \t\t\t\t ║                       ║"
					echo "  \t\t\t\t ║   Usuario eliminado   ║"
					echo "  \t\t\t\t ║                       ║"
					echo "  \t\t\t\t ╚═══════════════════════╝"
					sleep 2
					ty=$(( $ty + 1 ))

				else if [ $sn = n ] || [ $sn = N ];then

					clear
					echo "\n\t\t\t\t ............................"
					echo "  \t\t\t\t .                          ."
					echo "  \t\t\t\t .   Usuario no eliminado   . "
					echo "  \t\t\t\t .                          ."
					echo "  \t\t\t\t ............................"
					sleep 2
					ty=$(( $ty + 1 ))


				else
					clear
					echo "\n\t\t\t\t ........................."
					echo "  \t\t\t\t .                       ."
					echo "  \t\t\t\t .   Opción incorrecta   ."
					echo "  \t\t\t\t .                       ."
					echo "  \t\t\t\t ........................."
					sleep 2
				fi
				fi

			else
				clear
				echo "\n\t\t\t\t ............................"
				echo "  \t\t\t\t .                          ."
				echo "  \t\t\t\t .   El Usuario no existe   ."
				echo "  \t\t\t\t .                          ."
				echo "  \t\t\t\t ............................"
				sleep 2

			fi
			done		

		;;

#################################### Opción mostrar
		4)
			clear
			echo "  \t\t\t\t ---------------------------\n"
			echo "  \t\t\t\t     Los usuarios son: "
			echo "\n\t\t\t\t ---------------------------\n"
			ls /tmp/admx/user
			echo "\n\t\t\t\t ---------------------------"
			read 4na
		;;

############################### Opción eliminar memoria conmpartida
		5)
			clear
			cd /tmp/admx
			ipcs -m | grep -v nattch | grep -v Segmentos | grep -v '^$' | awk '{print $2"\t"$6}' > memo
			while read ID NUM
			do
				if (( NUM != 2 ))
					then
					ipcrm -m $ID
					clear
					y=$(( $y +1 ))
					echo "\n\t\t\t\t =================================="
					echo "  \t\t\t\t   Borro el segmento: $ID"
					echo "  \t\t\t\t =================================="
					sleep 2
				else
					clear
					y=$(( $y +1 ))
					echo "\n\t\t\t\t ...................................."
					echo "  \t\t\t\t .                                  ."
					echo "  \t\t\t\t .   No hay segmentos para borrar   ."
					echo "  \t\t\t\t .                                  ."	
					echo "  \t\t\t\t ...................................."
					sleep 1
				fi
		

			done < /tmp/admx/memo
			rm /tmp/admx/memo

		;;

############################################# Opción usuarios activos
			6)
				clear
				echo "  \t\t\t\t -----------------------------\n"
				echo "  \t\t\t\t   Los Usuarios activos son: "
				echo "\n\t\t\t\t -----------------------------\n"
				ls /tmp/admx/activo
				echo "\n\t\t\t\t -----------------------------"
				read 6na
			;;

################################## Opción cerrando sesión
		0)
			clear
			echo "\n\t\t\t\t +++++++++++++++++++++++"
			echo "  \t\t\t\t +                     +"
			echo "  \t\t\t\t +   Cerrando sesión   +"
			echo "  \t\t\t\t +                     +"
			echo "  \t\t\t\t +++++++++++++++++++++++"
			sleep 2
			b=$(( $b + 1 ))
		;;

################################## Opción incorrecta
		*)
			clear
			echo "\n\t\t\t\t ........................."
			echo "  \t\t\t\t .                       ."
			echo "  \t\t\t\t .   Opción incorrecta   ."
			echo "  \t\t\t\t .                       ."
			echo "  \t\t\t\t ........................."
			sleep 2
		;;
		esac
		done
			#Termina como administrador
##########################################################################################################################
			#Inicio como usuario
else

	cd /tmp/admx/activo
	if [ ! -f $user ];then

		cd /tmp/admx/user/
		usu=$( find $user )
		pass=$( grep $cont $user )

		if [ $user = $usu ] && [ $cont = $pass ];then

			clear
			echo "\n\t\t\t\t ╔══════════════════════╗"
			echo "  \t\t\t\t ║                      ║"
			echo "  \t\t\t\t ║   Iniciando sesión   ║"
			echo "  \t\t\t\t ║                      ║"
			echo "  \t\t\t\t ╚══════════════════════╝"
			sleep 2
			echo > /tmp/admx/activo/$user
			clear
			echo "\n\t\t\t\t ==============================="
			echo   "\t\t\t\t    Bienvenido "$user 
			echo   "\t\t\t\t ==============================="
			inicio=$(( $inicio + 1))
			sleep 2
			clear

			lk=0
			until [ $lk -eq 1 ];do

			clear
			echo "\t\t\t\t ┌─────────────────────────┐"
			echo "\t\t\t\t │     Menú principal      │"
			echo "\t\t\t\t │=========================│"
			echo "\t\t\t\t │1)Crear documento        │"
			echo "\t\t\t\t │2)Editar documento       │"
			echo "\t\t\t\t │3)Borrar documento       │"
			echo "\t\t\t\t │4)Mostrar un documento   │"
			echo "\t\t\t\t │5)Mostrar mis documentos │"
			echo "\t\t\t\t │6)ver usuarios activos   │"
			echo "\t\t\t\t │0)Cerrar sesión          │"
			echo "\t\t\t\t └─────────────────────────┘\n"
			echo -n "\t\t\t\t Elija una opción: "
			read op12

			case $op12 in

################################################ Crear documento
			1)
				clear
				echo "\n\t\t\t\t ╔═════════════════════════╗"
				echo "  \t\t\t\t ║                         ║"
				echo   "\t\t\t\t ║   Abriendo aplicación   ║"
				echo "  \t\t\t\t ║                         ║"
				echo   "\t\t\t\t ╚═════════════════════════╝"
				sleep 1
				clear
				echo -n "\n\t\t\t\t Ingrese un nombre para el documento: "
				read doc
				clear
				echo "\n\t\t\t\t ╔═══════════════════════╗"
				echo "  \t\t\t\t ║                       ║"
				echo   "\t\t\t\t ║   Creando documento   ║"
				echo "  \t\t\t\t ║                       ║"
				echo   "\t\t\t\t ╚═══════════════════════╝"
				sleep 1
				clear
				echo "Para salir del documento presione ctrl + D"
				echo --------------------------------------------	
				cd /tmp/admx/usuarios/$user/Documentos
				cat >$doc
				clear
				echo "\n\t\t\t\t ╔═════════════════════════╗"
				echo "  \t\t\t\t ║                         ║"
				echo "  \t\t\t\t ║   Guardando documento   ║"
				echo "  \t\t\t\t ║                         ║"
				echo "  \t\t\t\t ╚═════════════════════════╝"
				sleep 2
		
			;;

##################################################### Editando documento
			2)
				dos=0
				until [ $dos -eq 1 ];do
				clear
				echo -n "\n\t\t\t\t Ingrese el nombre del documento para editar: "
				read ded

				if [ -f $ded ];then
					clear
					echo "\n\t\t\t\t ╔════════════════════════╗"
					echo "  \t\t\t\t ║                        ║"
					echo "  \t\t\t\t ║   Abriendo documento   ║"
					echo "  \t\t\t\t ║                        ║"
					echo "  \t\t\t\t ╚════════════════════════╝"
					sleep 2
					clear
					echo "Para salir del documento presione ctrl + D"
					echo --------------------------------------------
					cat $ded
					cat>>$ded
					clear
					echo "\n\t\t\t\t ╔═════════════════════════╗"
					echo "  \t\t\t\t ║                         ║"
					echo "  \t\t\t\t ║   Guardando documento   ║"
					echo "  \t\t\t\t ║                         ║"
					echo "  \t\t\t\t ╚═════════════════════════╝"
					sleep 2
					dos=$(( $dos +1 ))

				else 
					clear
					echo "\n\t\t\t\t .............................."
					echo "  \t\t\t\t .                            ."
					echo "  \t\t\t\t .   El documento no existe   ."
					echo "  \t\t\t\t .                            ."
					echo "  \t\t\t\t .............................."
					sleep 2
				fi
				done

			;;

################################################### Eliminar documento
			3)
				tres=0
				until [ $tres -eq 1 ];do
				clear
				echo -n "\n\t\t\t\t Ingrese el nombre del documento para eliminar: "
				read del
				cd /tmp/admx/usuarios/$user/Documentos

				if [ -f $del ];then
			
					echo -n "\n\t\t\t ¿Seguro que quieres eliminar el documento?(s/n): "
					read sne
					if [ $sne = s ] || [ $sne = S ];then

						clear
						echo "\n\t\t\t\t ╔══════════════════════════╗"
						echo "  \t\t\t\t ║                          ║"
						echo "  \t\t\t\t ║   Eliminando documento   ║"
						echo "  \t\t\t\t ║                          ║"
						echo   "\t\t\t\t ╚══════════════════════════╝"
						sleep 1
						rm $del
						clear
						echo "\n\t\t\t\t ╔═════════════════════════╗"
						echo "  \t\t\t\t ║                         ║"
						echo "  \t\t\t\t ║   Documento eliminado   ║"
						echo "  \t\t\t\t ║                         ║"
						echo "  \t\t\t\t ╚═════════════════════════╝"
						tres=$(( $tres +1 ))
						sleep 1
						
					else if [ $sne = n ] || [ $sne = N ];then

						clear
						echo "\n\t\t\t\t ...................................."
						echo "  \t\t\t\t .                                  ."
						echo "  \t\t\t\t .   El documento no fue eiminado   ."
						echo "  \t\t\t\t .                                  ."
						echo "  \t\t\t\t ...................................."
						sleep 2
					else
						clear
						echo "\n\t\t\t\t ........................."
						echo "  \t\t\t\t .                       ."
						echo "  \t\t\t\t .   Opción incorrecta   ."
						echo "  \t\t\t\t .                       ."
						echo "  \t\t\t\t ........................."
						sleep 2
					fi
					fi
				
			
					else
					clear
					echo "\n\t\t\t\t .............................."
					echo "  \t\t\t\t .                            ."
					echo "  \t\t\t\t .   El documento no existe   ."
					echo "  \t\t\t\t .                            ."
					echo "  \t\t\t\t .............................."
					sleep 2
				fi
				done

			;;

################################################ Mostrar documento
			4)
				cuatro=0
				until [ $cuatro -eq 1 ];do
				clear
				echo -n "\n\t\t\t\t Ingrese el nombre del documento para mostrar: "
				read dbus
				cd /tmp/admx/usuarios/$user/Documentos
				if [ -f $dbus ];then
					clear
					echo "\n\t\t\t\t ╔════════════════════════╗"
					echo "  \t\t\t\t ║                        ║"
					echo "  \t\t\t\t ║   Abriendo documento   ║"
					echo "  \t\t\t\t ║                        ║"
					echo "  \t\t\t\t ╚════════════════════════╝"
					sleep 2
					clear

					cat $dbus
					read na4

					clear
					echo "\n\t\t\t\t ╔════════════════════════╗"
					echo "  \t\t\t\t ║                        ║"
					echo "  \t\t\t\t ║   Cerrando documento   ║"
					echo "  \t\t\t\t ║                        ║"
					echo "  \t\t\t\t ╚════════════════════════╝"
					sleep 2
					cuatro=$(( $cuatro +1 ))
			
				else
					clear
					echo "\n\t\t\t\t .............................."
					echo "  \t\t\t\t .                            ."
					echo "  \t\t\t\t .   El documento no existe   ."
					echo "  \t\t\t\t .                            ."
					echo "  \t\t\t\t .............................."
					sleep 2
				fi
				done

			;;

################################################### Mostrar mis documento
			5)
				clear
				echo "  \t\t\t\t ------------------------\n"
				echo "  \t\t\t\t      Mis documentos "
				echo "\n\t\t\t\t -------------------------\n"
				ls /tmp/admx/usuarios/$user/Documentos
				echo "\n\t\t\t\t -------------------------"
				read na5
			;;

############################################### Usuarios activos
			6)
				clear
				echo "  \t\t\t\t -----------------------------\n"
				echo "  \t\t\t\t   Los Usuarios activos son: "
				echo "\n\t\t\t\t -----------------------------\n"
				ls /tmp/admx/activo
				echo "\n\t\t\t\t -----------------------------"
				read na6
			;;

################################################### Cerrando sesión
			0)
				clear
				echo "\n\t\t\t\t +++++++++++++++++++++++"
				echo "  \t\t\t\t +                     +"
				echo "  \t\t\t\t +   Cerrando sesión   +"
				echo "  \t\t\t\t +                     +"
				echo "  \t\t\t\t +++++++++++++++++++++++"
				rm /tmp/admx/activo/$user
				sleep 4
				lk=$(( $lk +1 ))
			;;

############################################### Opción incorecta
			*)
				clear
				echo "\n\t\t\t\t ........................."
				echo "  \t\t\t\t .                       ."
				echo "  \t\t\t\t .   Opción incorrecta   ."
				echo "  \t\t\t\t .                       ."
				echo "  \t\t\t\t ........................."
				sleep 2
			;;

			esac
			done
		else
		clear
		echo "\n\t\t\t\t ........................................."
		echo "  \t\t\t\t .                                       ."
		echo "  \t\t\t\t .   Usuario y/o Contraseña incorrecta   ."
		echo "  \t\t\t\t .                                       ."
		echo "  \t\t\t\t ........................................."
		sleep 2
		fi
	else
	clear
	echo "\n\t\t\t\t ..................................."
	echo "  \t\t\t\t .                                 ."
	echo "  \t\t\t\t .   El usuario esta activo aún    ."
	echo "  \t\t\t\t .                                 ."
	echo "  \t\t\t\t ..................................."
	sleep 2

	 fi
fi
done
;;

######################################### Cerrando Software
0)
	clear
	echo "\n\t\t\t\t +++++++++++++++++++++++++"
	echo "  \t\t\t\t +                       +"
	echo "  \t\t\t\t +   Cerrando software   +"
	echo "  \t\t\t\t +                       +"
	echo "  \t\t\t\t +++++++++++++++++++++++++"
	sleep 2
	clear
	exit
;;
##################################### Opción incorrecta
*)
	clear
	echo "\n\t\t\t\t ........................."
	echo "  \t\t\t\t .                       ."
	echo "  \t\t\t\t .   Opción incorrecta   ."
	echo "  \t\t\t\t .                       ."
	echo "  \t\t\t\t ........................."
	sleep 2
;;
esac
				#creando administrador porque no existe
################################################################################################
else

	num_ad=0
	until [ $num_ad -eq 1 ];do
	clear
	echo "\n\t\t\t\t ╔═══════════════════════╗"
	echo "  \t\t\t\t ║                       ║"
	echo "  \t\t\t\t ║  Crear administrador  ║"
	echo "  \t\t\t\t ║                       ║"
	echo "  \t\t\t\t ╚═══════════════════════╝"
	echo -n "\n\t\t\t\t Ingrese nombre de usario: "
	read admi
	echo -n "\n\t\t\t\t Ingrese contraseña: "
	stty -echo
	read pasw
	echo -n "\n\n\t\t\t\t Ingrese de nuevo la contraseña: "
	read pasw1
	echo
	stty echo
		
		if [ $pasw = $pasw1 ];then
			num_ad=$(( num_ad + 1 ))
			echo $admi >> /tmp/admx/admin/administrador
			echo $pasw >> /tmp/admx/admin/contrasenia
			clear
			echo "\n\t\t\t\t ╔════════════════════════╗"
			echo "  \t\t\t\t ║                        ║"
			echo "  \t\t\t\t ║  Administrador creado  ║"
			echo "  \t\t\t\t ║                        ║"
			echo "  \t\t\t\t ╚════════════════════════╝"
			sleep 2
			echo

		else
			clear
			echo "\n\t\t\t\t ........................................................"
			echo "  \t\t\t\t .                                                      ."
			echo "  \t\t\t\t .   Las contraseñas no coinciden ingreselo de vuelta   ."
			echo "  \t\t\t\t .                                                      ."
			echo "  \t\t\t\t ........................................................"
			sleep 2
		fi
	done
fi
done
##############################################################################################################
				#Termina shell
