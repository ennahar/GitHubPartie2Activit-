?USE [ProjetGestion]
GO
/****** Object:  Table [dbo].[HP]    Script Date: 25/11/2018 10:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HP](
	[hp_id] [int] IDENTITY(1,1) NOT NULL,
	[hp_date] [date] NOT NULL,
	[hp_tj] [float] NOT NULL,
	[hp_codeU] [varchar](5) NOT NULL,
	[hp_codeP] [varchar](5) NULL,
 CONSTRAINT [PK_HP] PRIMARY KEY CLUSTERED 
(
	[hp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 25/11/2018 10:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[m_id] [int] IDENTITY(1,1) NOT NULL,
	[m_code] [varchar](5) NOT NULL,
	[m_nom] [varchar](50) NOT NULL,
	[m_prenom] [varchar](50) NOT NULL,
	[m_email] [varchar](100) NULL,
	[m_codeS] [varchar](5) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[m_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projet]    Script Date: 25/11/2018 10:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projet](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[p_code] [varchar](5) NOT NULL,
	[p_desc] [varchar](100) NOT NULL,
	[p_codeS] [varchar](5) NULL,
 CONSTRAINT [PK_Projet] PRIMARY KEY CLUSTERED 
(
	[p_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 25/11/2018 10:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[s_id] [int] IDENTITY(1,1) NOT NULL,
	[s_code] [varchar](5) NOT NULL,
	[s_desc] [varchar](100) NOT NULL,
	[s_resp] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[s_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 25/11/2018 10:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_code] [varchar](5) NOT NULL,
	[u_nom] [varchar](50) NOT NULL,
	[u_prenom] [varchar](50) NOT NULL,
	[u_email] [varchar](100) NULL,
	[u_codeS] [varchar](5) NULL,
	[u_codeM] [varchar](5) NULL,
 CONSTRAINT [PK_Utilisateur] PRIMARY KEY CLUSTERED 
(
	[u_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Identite]    Script Date: 25/11/2018 10:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Identite]
AS
SELECT        u_code, u_nom + ' ' + u_prenom AS identite
FROM            dbo.Utilisateur
GO
ALTER TABLE [dbo].[HP]  WITH CHECK ADD  CONSTRAINT [FK_HP_Projet] FOREIGN KEY([hp_codeP])
REFERENCES [dbo].[Projet] ([p_code])
GO
ALTER TABLE [dbo].[HP] CHECK CONSTRAINT [FK_HP_Projet]
GO
ALTER TABLE [dbo].[HP]  WITH CHECK ADD  CONSTRAINT [FK_HP_Utilisateur] FOREIGN KEY([hp_codeU])
REFERENCES [dbo].[Utilisateur] ([u_code])
GO
ALTER TABLE [dbo].[HP] CHECK CONSTRAINT [FK_HP_Utilisateur]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Service] FOREIGN KEY([m_codeS])
REFERENCES [dbo].[Service] ([s_code])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Service]
GO
ALTER TABLE [dbo].[Projet]  WITH CHECK ADD  CONSTRAINT [FK_Projet_Projet] FOREIGN KEY([p_code])
REFERENCES [dbo].[Projet] ([p_code])
GO
ALTER TABLE [dbo].[Projet] CHECK CONSTRAINT [FK_Projet_Projet]
GO
ALTER TABLE [dbo].[Projet]  WITH CHECK ADD  CONSTRAINT [FK_Projet_Service] FOREIGN KEY([p_codeS])
REFERENCES [dbo].[Service] ([s_code])
GO
ALTER TABLE [dbo].[Projet] CHECK CONSTRAINT [FK_Projet_Service]
GO
ALTER TABLE [dbo].[Utilisateur]  WITH CHECK ADD  CONSTRAINT [FK_Utilisateur_Utilisateur] FOREIGN KEY([u_codeS])
REFERENCES [dbo].[Manager] ([m_code])
GO
ALTER TABLE [dbo].[Utilisateur] CHECK CONSTRAINT [FK_Utilisateur_Utilisateur]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Utilisateur"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Identite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Identite'
GO
