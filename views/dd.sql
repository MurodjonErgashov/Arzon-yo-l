--select * from LetterMap
--script used to create LetterMap records for a given Tenant and LOB
INSERT INTO dbo.LetterMap ( [BenefitPlanID],
 [Name],
 [Language], [Image],
 [Phone], [Fax],
 [AppealAddress1], [AppealAddress2],
 [AppealAddressCity], [AppealAddressState],
 [AppealAddressZip], [NomncQioName],
 [NomncQioTollFreeNumber], [NomncQioTtyNumber],
 [OpenHours], [CreatedOn],
 [CreatedBy], [ModifiedOn],
 [ModifiedBy], [TenantID],
 [TenantName], [ManagedStartDate],
 [ManagedEndDate])SELECT 
 abp.BenefitPlanID, NULL, --[Name]
 NULL, --[Language] NULL, --[Image]
 NULL, --[Phone] NULL, --[Fax]
 NULL, --[AppealAddress1] NULL, --[AppealAddress2]
 NULL, --[AppealAddressCity] NULL, --[AppealAddressState]
 NULL, --[AppealAddressZip] NULL, --[NomncQioName]
 NULL, --[NomncQioTollFreeNumber] NULL, --[NomncQioTtyNumber]
 NULL, --[OpenHours] GETUTCDATE(), --[CreatedOn]
 'INichitenko@mynexuscare.com', --[CreatedBy] GETUTCDATE(), --[ModifiedOn]
 'INichitenko@mynexuscare.com', --[ModifiedBy] t.TenantId,
 t.TenantName, NULL, --[ManagedStartDate]
 NULL --[ManagedEndDate]FROM dbo.AnthemBenefitPlan abp
INNER JOIN dbo.AnthemLineOfBusiness lob on lob.LineOfBusinessId = abp.LineOfBusinessId 
INNER JOIN replica.TenantLoBProduct tlp on tlp.LineOfBusinessId = lob.LineOfBusinessId 
INNER JOIN dbo.Tenant t on t.TenantId = tlp.TenantId 
WHERE NOT EXISTS ( SELECT 1 FROM  dbo.LetterMap l WHERE l.BenefitPlanID = abp.BenefitPlanID)
AND lob.LineOfBusiness = 'Medicaid' AND t.TenantName = 'Anthem' 
AND abp.CreatedBy = 'INichitenko@mynexuscare.com' --AND abp.CreatedOn = '2024-03-15 22:33:55.140'