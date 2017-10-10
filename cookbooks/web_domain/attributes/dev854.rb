############################################
#            TPAPSAPPD2 SETTINGS           #
############################################

############ FIN SETTINGS ############
default['WEBSERV']['TPAPSAPPD2']['FIN'] = {
   "PsCfgHome"                => "/apps/psoft/pt854",
   "UserId"                   => "system",
   "UserPwd"                  => "password11",
   "DomainName"               => "tpapsappd2_fin_example",
   "BEA_HOME"                 => "/apps/psoft/weblogic1212",
   "SingleOrMultiIntall"      => "SINGLE",
   "WebSiteName"              => "FIUDEV",
   "AppServerName"            => "nycfindtst1.timeinc.com",
   "JSLPort"                  => "9200",
   "HTTPPort"                 => "4080",
   "HTTPSPort"                => "443",
   "AuthDomain"               => "timeinc.com",
   "WebProfName"              => "DEV",
   "WebProfPwd"               => "asdf11asdf",
   "IGWUserId"                => "administrator",
   "IGWPwd"                   => "password",
   "ReportsDir"               => "/appdata/psreports",
   "PSHome"                   => "/apps/psoft/pt854",
   "PIAHome"                  => "/apps/psoft/pt854",
   "WLHome"                   => "/apps/psoft/weblogic1212/wlserver",
   "JavaOptionsLinux"         => "-server -Xms1536m -Xmx1536m -XX:MaxPermSize=256m -Dtoplink.xml.platform=oracle.toplink.platform.xml.jaxp.JAXPPlatform -Dcom.sun.xml.namespace.QName.useCompatibleSerialVersionUID=1.0",
   "AdmHostName"              => "tpapsappp1.timeinc.com",
   "AdmServerName"            => "WebLogicAdmin"
}

