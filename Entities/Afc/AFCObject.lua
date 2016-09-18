
AFCObject = {
    Properties = {
        fileModelGeometry = "",
        nCaptureType = 2,
        bActive = 1,
        fRyseTime = 1.833,
        
        Physic = {
            nMass = 1,
            fGravity = 9.8,
            fHeight = 1,
            vectorSize = { x=1, y=1, z=1 },
            },
    },
    
    bIsRunning = 0,
    fSumTime = 0,                   -- AFC Code: Variable
    vDir = { x=0, y=0, z=0, },
    
    PhysicTable = {
        mass = 1,
        gravity = 9.8,
        height = 1,
        size = { x=1, y=1, z=1 },
        },
        
    vecFirstPos = {x = 0, y = 0, z = 0},
    
    fRyseTime = 1.833,
    luaActive = 1,
    
    Editor={
		Icon = "physicsobject.bmp",
		IconOnTop=1,
	},
}

function AFCObject:OnInit ()
    self:OnReset () ;
end

function AFCObject:OnPropertyChange ()
    self:OnReset () ;
end

function AFCObject:OnReset ()
    self:Activate (self.Properties.bActive) ;
    self.luaActive = self.Properties.bActive ;
    self.fRyseTime = self.Properties.fRyseTime ;
    
    self.nCaptureType = self.Properties.nCaptureType ;
    self.vecFirstPos = self:GetPos () ;
    self.PhysicTable.mass = self.Properties.Physic.nMass ;
    self.PhysicTable.gravity = self.Properties.Physic.fGravity ;
    self.PhysicTable.height = self.Properties.Physic.fHeight ;
    self.PhysicTable.size = self.Properties.Physic.vectorSize ;
    
    if self.Properties.fileModelGeometry ~= "" then
        self:LoadObject(0, self.Properties.fileModelGeometry) ;                             -- AFC Code: Load Geometry
        self:Physicalize(0,PE_RIGID, {mass=1000, density=-1,});                             -- AFC Code: Physicalize
        self:AwakeEnvironment() ;
        self:AwakePhysics(1) ;
    end

    self.bIsRunning = 0 ;
end

function AFCObject:OnUpdate (deltaTime)
    self:AwakePhysics(1) ;
    if self.bIsRunning == 1 then
        
        self:AwakePhysics(0) ;
    
         self.fSumTime = self.fSumTime + deltaTime ;
    
        if self.fSumTime < self.fRyseTime then
            Log ("Sum Time is " .. tostring (self.fSumTime)) ;
            local zZ = deltaTime * 30 ;
            local vecTemp = {x=0, y=0, z=zZ} ;
            self:SetVelocity (vecTemp) ;
            return
        end
            
        self.vDir = ScaleVector (self.vDir, 4) ;
        
        --Log (tostring(self.vDir.x) .. ", " .. tostring (self.vDir.y) .. ", " .. tostring (self.vDir.z)) ;
        self:SetVelocity (self.vDir) ;
    else
        self.fSumTime = 0 ;
        
    end
end