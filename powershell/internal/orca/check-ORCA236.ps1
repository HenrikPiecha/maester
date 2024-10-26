# Generated on 10/25/2024 17:06:49 by .\build\orca\Update-OrcaTests.ps1

<#

ORCA-236

Checks to determine if SafeLinks action for unknown potentially malicious URLs in emails

#>

#using module "..\Maester.psm1"

class ORCA236 : ORCACheck
{
    <#
    
        CONSTRUCTOR with Check Header Data
    
    #>

    ORCA236()
    {
        $this.Control=236
        $this.Services=[ORCAService]::MDO
        $this.Area="Microsoft Defender for Office 365 Policies"
        $this.Name="Safe Links protections for links in email"
        $this.PassText="Safe Links is enabled for emails"
        $this.FailRecommendation="Enable Safe Links policy action for unknown potentially malicious URLs in emails"
        $this.Importance="When Safe Links for emails is enabled, URLs in emails will be checked when users click on links."
        $this.ExpandResults=$True
        $this.CheckType=[CheckType]::ObjectPropertyValue
        $this.ObjectType="Safe Links policy"
        $this.ChiValue=[ORCACHI]::Medium
        $this.ItemName="Setting"
        $this.DataType="Current Value"
        $this.Links= @{
            "Microsoft 365 Defender Portal - Safe links"="https://security.microsoft.com/safelinksv2"
            "Recommended settings for EOP and Microsoft Defender for Office 365"="https://aka.ms/orca-atpp-docs-7"
        }
    }

    <#
    
        RESULTS
    
    #>

    GetResults($Config)
    {

        ForEach($Policy in $Config["SafeLinksPolicy"]) 
        {

            # Policy is turned on, default false
            $PolicyEnabled = $false

            $PolicyName = $Config["PolicyStates"][$Policy.Guid.ToString()].Name

            # Check objects
            $ConfigObject = [ORCACheckConfig]::new()
            $ConfigObject.Object=$PolicyName
            $ConfigObject.ConfigItem="EnableSafeLinksForEmail"
            $ConfigObject.ConfigData=$Policy.EnableSafeLinksForEmail
            $ConfigObject.ConfigReadonly = $Policy.IsPreset
            $ConfigObject.ConfigPolicyGuid=$Policy.Guid.ToString()
            $ConfigObject.ConfigDisabled = $Config["PolicyStates"][$Policy.Guid.ToString()].Disabled
            $ConfigObject.ConfigWontApply = !$Config["PolicyStates"][$Policy.Guid.ToString()].Applies

            if($Policy.EnableSafeLinksForEmail -eq $true)
            {
                $ConfigObject.SetResult([ORCAConfigLevel]::Standard,"Pass")
                
            }
            Else
            {
                $ConfigObject.SetResult([ORCAConfigLevel]::Standard,"Fail")
            }
            
            $this.AddConfig($ConfigObject)
        }

    }

}
