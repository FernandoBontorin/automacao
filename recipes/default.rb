#
# Cookbook:: automacao
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#temp dir
directory 'C:\\temp' do
	action :create
end

directory 'C:\\temp\\automacao' do
	action :create
end

#Java
cookbook_file 'C:\\temp\\automacao\\jdk.exe' do
	source 'jdk.exe'
	:create_if_missing
	not_if { ::File.exist?('C:\\Program Files (x86)\\Common Files\\Oracle\\Java\\javapath\\java.exe') }

end

powershell_script 'Install Java' do
	code 'C:\\temp\\automacao\\jdk.exe /s'
	guard_interpreter :powershell_script
	not_if { ::File.exist?('C:\\Program Files (x86)\\Common Files\\Oracle\\Java\\javapath\\java.exe') }
end



#Greenshot
remote_file 'C:\\temp\\automacao\\greenshot.exe' do
	source 'https://github.com/greenshot/greenshot/releases/download/Greenshot-RELEASE-1.2.10.6/Greenshot-INSTALLER-1.2.10.6-RELEASE.exe'
	action :create_if_missing
	not_if { ::File.exist?('C:\\Program Files\\Greenshot\\Greenshot.exe') }
end

powershell_script 'Install Greenshot' do
	code 'C:\\temp\\automacao\\greenshot.exe /VERYSILENT'
	guard_interpreter :powershell_script
	not_if { ::File.exist?('C:\\Program Files\\Greenshot\\Greenshot.exe') }
end

#Winrar
remote_file 'C:\\temp\\automacao\\winrar.exe' do
	source 'https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-561.exe'
	action :create_if_missing
	not_if { ::File.exist?('C:\\Program Files\\WinRAR\\WinRAR.exe') }
end

powershell_script 'Install WinRAR' do
	code 'C:\\temp\\automacao\\winrar.exe /s'
	guard_interpreter :powershell_script
	not_if { ::File.exist?('C:\\Program Files\\WinRAR\\WinRAR.exe') }
end

#Notepad++
remote_file 'C:\\temp\\automacao\\npp.exe' do
	source 'https://notepad-plus-plus.org/repository/7.x/7.5.8/npp.7.5.8.Installer.x64.exe'
	action :create_if_missing
	not_if { ::File.exist?('C:\\Program Files\\Notepad++\\notepad++.exe') }
end

powershell_script 'Install Notepad++' do
	code 'C:\\temp\\automacao\\npp.exe /S'
	guard_interpreter :powershell_script
	not_if { ::File.exist?('C:\\Program Files\\Notepad++\\notepad++.exe') }
end

#Putty
remote_file 'C:\\temp\\automacao\\putty.msi' do
	source 'https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.70-installer.msi'
	action :create_if_missing
	not_if { ::File.exist?('C:\\Program Files\\PuTTY\\putty.exe') }
end

powershell_script 'Install Putty' do
	code 'C:\\temp\\automacao\\putty.msi /quiet'
	guard_interpreter :powershell_script
	not_if { ::File.exist?('C:\\Program Files\\PuTTY\\putty.exe') }
end



#Sessao de diretorios
directory 'C:\\Automacao' do
	action :create
end

directory 'C:\\Automacao\\etc' do
	action :create
end

directory 'C:\\Automacao\\Evidencias' do
	action :create
end

directory 'C:\\Automacao\\massas' do
	action :create
end

directory 'C:\\Automacao\\massas\\arbor' do
	action :create
end

directory 'C:\\Automacao\\massas\\arbor\\CDR' do
	action :create
end

directory 'C:\\Automacao\\massas\\arbor\\CSV' do
	action :create
end

directory 'C:\\Automacao\\Parametros' do
	action :create
end

#Sessao Evidencias
cookbook_file 'C:\\Automacao\\Evidencias\\logoOi.png' do
	source 'logoOi.png'
	action :create_if_missing
end

cookbook_file 'C:\\Automacao\\Evidencias\\Template.doc' do
	source 'Template.doc'
	action :create_if_missing
end

cookbook_file 'C:\\Automacao\\Evidencias\\Exemplo Evidencia.doc' do
	source 'Exemplo Evidencia.doc'
	:create_if_missing
end

#Sessao Parametros
file 'C:\\Automacao\\Parametros\\login_Auditoria.txt' do
	content 'Oi\\U14237
	U14237'
	:create_if_missing
end

file 'C:\\Automacao\\Parametros\\login_Click.txt' do
	content 'OI\TR412062
	HakuSho0'
	:create_if_missing
end

file 'C:\\Automacao\\Parametros\\login_OMR.txt' do
	content 'Oi\upadmin
	upadmin'
	:create_if_missing
end

file 'C:\\Automacao\\Parametros\\login_OMS.txt' do
	content 'Oi\tc049497
	tc049497'
	:create_if_missing
end

file 'C:\\Automacao\\Parametros\\login_Portal_Operacoes.txt' do
	content 'Wallace
	TR412141'
	:create_if_missing
end

file 'C:\\Automacao\\Parametros\\login_SAC.txt' do
	content 'Oi\TR571972
	prisma01'
	:create_if_missing
end

file 'C:\\Automacao\\Parametros\\login_SFA.txt' do
	content 'Oi\TC045503
	Ambientes_06%'
	:create_if_missing
end

file 'C:\\Automacao\\Parametros\\login_Siebel.txt' do
	content 'Oi\TR450404
	TR450404'
	:create_if_missing
end

file 'C:\\Automacao\\Parametros\\login_STC.txt' do
	content 'Oi\F88055
	Chikru12'
	:create_if_missing
end

#Reiniciar após instalar os paranaue
reboot 'consistencia do PATH' do
	delay_mins 5
	reason 'Habilitar variaveis do sistema'
	action :reboot_now
end