CREATE TABLE [Member] (
  [MemberID] INT,
  [First_Name] Varchar(40),
  [Last_Nmae] Varchar(40),
  [postcode] Varchar(40),
  [Address] Varchar(40),
  [creditcard] Varchar(40),
  PRIMARY KEY ([MemberID])
);

CREATE TABLE [MembershipClup] (
  [ClubID] INT,
  [Description] varchar(40),
  PRIMARY KEY ([ClubID])
);

CREATE TABLE [Registration ] (
  [RegistrationID] Int,
  [RegistrrationDate] Datetime,
  [RegisrationFee] Float,
  [regstrationVat] Float,
  [clubID] INT,
  [MemberID] INT,
  PRIMARY KEY ([RegistrationID]),
  CONSTRAINT [FK_Registration .clubID]
    FOREIGN KEY ([clubID])
      REFERENCES [MembershipClup]([ClubID])
);

CREATE TABLE [Promotion] (
  [PromotionID] INT,
  [promotionType] varchar(40),
  [date] date,
  [ClubID] INT,
  [discount] float,
  [validity] date,
  PRIMARY KEY ([PromotionID]),
  CONSTRAINT [FK_Promotion.ClubID]
    FOREIGN KEY ([ClubID])
      REFERENCES [MembershipClup]([ClubID])
);

CREATE TABLE [Staff] (
  [StaffID] INT,
  [Fist_Name] Varchar(40),
  [Last_Nme] Varchar(40),
  [Phone_number] char (20),
  [Email_address] varchar(40),
  [DOB] Varchar(40),
  [salary] float,
  PRIMARY KEY ([StaffID])
);

CREATE TABLE [MemberOrder] (
  [OrderNoID] INT,
  [ShippingAdress] Varchar(40),
  [PromotionID] INT,
  [identification_number] Varchar(40),
  [MemberID] INT,
  [Home_phone] Varchar(40),
  [StaffID] INT,
  PRIMARY KEY ([OrderNoID]),
  CONSTRAINT [FK_MemberOrder.PromotionID]
    FOREIGN KEY ([PromotionID])
      REFERENCES [Promotion]([PromotionID]),
  CONSTRAINT [FK_MemberOrder.StaffID]
    FOREIGN KEY ([StaffID])
      REFERENCES [Staff]([StaffID]),
  CONSTRAINT [FK_MemberOrder.MemberID]
    FOREIGN KEY ([MemberID])
      REFERENCES [Member]([MemberID])
);

