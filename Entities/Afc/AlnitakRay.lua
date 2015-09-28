----------------------------------------
-- AFC Tech
--
--  AlnitakRay.Lua created by Özkan Afacan
--------------------------------------------

AlnitakRay = {
    Properties= {
        fileModelObject = "Objects/ParticleFiles/AlnitakStar_Large.cgf",
        ParticleEffect = "Alnitak_Ray.Alnitak_Ray_Particles",
        ParticleEffectStart = "",
        ParticleEffectEnd = "Alnitak_Ray.Alnitak_Ray_Start",
        fParticleOffsetZ = 1.2,
        fSpeed = 3.0,
        fLatencyForAnimation = 0.4,
        fRotationSpeed = 1.0,
        fAmplitudeX = -0.8,
        fAmplitudeZ = -0.4,
        colorLightColor = { x=1, y=1, z=1 },
    },
    
    Editor={
		Icon = "physicsobject.bmp",
		IconOnTop=1,
	},
}

function AlnitakRay:OnInit ()
    self:OnReset () ;
end

function AlnitakRay:OnPropertyChange ()
    self:OnReset () ;
end

function AlnitakRay:OnReset ()
    BroadcastEvent (self, "Reset") ;
end

