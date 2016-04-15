-----------------------------------------------------
-- MiraLight.lua -- MiraLight Entity Lua Defination
--
--
--					AFC Studio Code -- 13.01.2016
----------------------------------------------------

MiraLight = {
	Properties = {
		fileModelObject = "Objects/ParticleFiles/star.cgf",
		bPositionMoving = 1.0,
		fIncLower = 0,
		fIncUpper = 2,
		colorLightColor = { x=1, y=1, z=1 },
        
        fRotXSpeed = 0.1,
        fRotYSpeed = 0.1,
        fRotZSpeed = 0.1,
        
        -- Properties table içinde tanımlanan değişkenler doğrudan editörde gözükecek olanlardır.
        -- Ön ekler ile editörde hangi değeri temsil ettiği belirlenebilir:
        -- f - float, file - file Path, color -- color
        -- Ön ekler editör tarafından gizlenirler.
        
        -- Bu değerler doğrudan C++ tarafından okunabilir.
	},
	
	Editor={
		Icon = "physicsobject.bmp",
		IconOnTop=1,
	},
}

-- Event Fonksiyonları:

function MiraLight:OnInit ()        -- Engine tarafından, entity ilk kullanıma hazırlanırken çağrılır.
    Log(self:GetName() .. ": OnInit Function!")
    self:OnReset () ;
end

function MiraLight:OnPropertyChange () -- Engine tarafından, entity değerlerinde değişiklik meydana geldiği zaman çağrılır.
    Log(self:GetName() .. ": OnPropertyChange Function!")
    self:OnReset () ;
end

function MiraLight:OnReset ()           -- Engine tarafından, entity nin resetlenmesi gerektiği zaman çağrılır.
                                        -- Note: Lua içinde OnInit ve OnPropertyChange fonksiyonlarının bunu çağırmasını istedik.
    Log(self:GetName() .. ": OnReset Function!")
    BroadcastEvent (self, "Reset") ;    -- C++ a Event göndermek için kullanılıyor. C++ Process Event ile bu durumu ele alıyor.
end

-- Not: Event fonksiyonlarının ne zaman çağrıldığını takip etmek için log fonksiyonları ekledik.
-- Log fonksiyonu girilen string i console çıktı olarak yollar.