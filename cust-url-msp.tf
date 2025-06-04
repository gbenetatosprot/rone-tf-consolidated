resource "panos_custom_url_category" "fw1_msp_block" {
  provider    = panos.fw1
  name        = "rone-msp-block"
  description = "rone-msp-block"
  sites = [
    "*.ccenter.tech/",
    "*.cityfederalcv.com/",
    "*.crossvalleyfcv.org/",
    "*.emailaccess-expirynotification.com/",
    "*.emailaccess-passwordnotice.com/",
    "*.expirationrequest-passwordreminder.com/",
    "*.expiryrequest-mailaccess.com/",
    "*.liparicasa.it/",
    "*.losgaucos.com/",
    "*.oufcv.com/",
    "*.portconnfcuu.com/",
    "*.realmetaldns.com/",
    "*.rotation.ahrealestatepr.com/",
    "*.skyudrive.com",
    "*.synology.ink",
    "*.triboro-fcv.org/",
    "ccenter.tech",
    "finconsult.cc/",
    "rotation.ahrealestatepr.com/",
    "skyudrive.com"
  ]
  type = "URL List"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_custom_url_category" "fw2_msp_block" {
  provider    = panos.fw2
  name        = "rone-msp-block"
  description = "rone-msp-block"
  sites = panos_custom_url_category.fw1_msp_block.sites
  type = "URL List"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_custom_url_category" "fw1_msp_allow" {
  provider    = panos.fw1
  name        = "rone-msp-allow"
  description = "rone-msp-allow"
  sites = [
    "*.amazontrust.com",
    "*.azure.com",
    "*.azureedge.net",
    "*.azurerms.com",
    "*.binding101.com/",
    "*.cloud.tanium.com",
    "*.cloudfront.net",
    "*.cloudsink.net",
    "*.cribl.cloud",
    "*.crowdstrike.com",
    "*.darktrace.com",
    "*.datorama.com",
    "*.digicert.com",
    "*.edgesuite.net",
    "*.entrust.net",
    "*.esha.com",
    "*.github.com",
    "*.identrust.com",
    "*.informationprotection.azure.com",
    "*.launchpad.net",
    "*.letsencrypt.org",
    "*.linxas.tools",
    "*.live.com",
    "*.live.net",
    "*.livefilestore.com",
    "*.mesh.com",
    "*.microsoft-tst.com",
    "*.microsoft.com",
    "*.microsoftonline-p.com",
    "*.microsoftonline.com",
    "*.msauth.net",
    "*.msauthimages.net",
    "*.msecnd.net",
    "*.msftauth.net",
    "*.msftauthimages.net",
    "*.msftcloudes.com",
    "*.msftconnecttest.com",
    "*.msftidentity.com",
    "*.msidentity.com",
    "*.msn.com",
    "*.ntp.org",
    "*.o365weve.com",
    "*.office.com",
    "*.office.net",
    "*.office365.com",
    "*.omniroot.com",
    "*.ondemand.com",
    "*.oneclient.sfx.ms",
    "*.onedrive.com",
    "*.onenote.com",
    "*.oracleoutsourcing.com",
    "*.protera.com",
    "*.sap.com",
    "*.sharepoint.com",
    "*.sharepointonline.com",
    "*.suse.com",
    "*.susecloud.net",
    "*.symantec.com",
    "*.symcb.com",
    "*.symcd.com",
    "*.tableau.com",
    "*.tanium.com",
    "*.ubuntu.com",
    "*.update.microsoft.com",
    "*.verisign.com",
    "*.verisign.net",
    "*.windows.net",
    "*.windowsazure.com",
    "*.windowsupdate.com",
    "*.windowsupdates.microsoft.com",
    "account.activedirectory.windowsazure.com",
    "aka.ms/",
    "amp.azure.net",
    "api.mapbox.com",
    "apis.live.net",
    "archive.ubuntu.com",
    "autologon.microsoftazuread-sso.com",
    "clientconfig.microsoftonline-p.net",
    "commgw.protera.com",
    "crwd.s3.us-east-2.amazonaws.com",
    "ent-shasta-rrs.symantec.com",
    "fabric.io",
    "flpnwc-g9a84e0b47.dispatcher.hana.ondemand.com",
    "flpnwc-s354bfe2f3.dispatcher.hana.ondemand.com",
    "github.com",
    "global-protera-ms-zsb1.cloud.tanium.com",
    "global-protera-ms-zsb2.cloud.tanium.com",
    "informationprotection.hosting.portal.azure.net",
    "ipchicken.com",
    "lfodown01-b.cloudsink.net",
    "lfodown01-gyr-maverick.cloudsink.net",
    "lfodown01-lanner-lion.cloudsink.net",
    "linux-repo.us.securitycloud.symantec.com",
    "liveupdate.symantec.com",
    "liveupdate.symantecliveupdate.com",
    "management.azure.com",
    "policykeyservice.dc.ad.msft.net",
    "protutilities.s3.us-east-2.amazonaws.com",
    "shellprod.msocdn.com",
    "workspaces.us-east-1.amazonaws.com",
    "*.inky.com",
    "*.oracle.com",
    "*.googleapis.com/",
    "*.aka.ms/*",
    "^.aka.ms/",
    "*.oraclecloud.com/*",
    "oraclecloud.com/",
    "^.oraclecloud.com/"
  ]
  type = "URL List"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_custom_url_category" "fw2_msp_allow" {
  provider    = panos.fw2
  name        = "rone-msp-allow"
  description = "rone-msp-allow"
  sites       = panos_custom_url_category.fw1_msp_allow.sites
  type        = "URL List"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_custom_url_category" "fw1_external_url" {
  provider    = panos.fw1
  name        = "rone-external-url"
  description = "rone-external-url"
  sites       = ["protera.com"]
  type        = "URL List"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_custom_url_category" "fw2_external_url" {
  provider    = panos.fw2
  name        = "rone-external-url"
  description = "rone-external-url"
  sites       = panos_custom_url_category.fw1_external_url.sites
  type        = "URL List"

  lifecycle {
    create_before_destroy = true
  }
}
