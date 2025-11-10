import unittest
from statistics_service import StatisticsService
from player import Player

class PlayerReaderStub:
    def get_players(self):
        return [
            Player("Semenko", "EDM", 4, 12),
            Player("Lemieux", "PIT", 45, 54),
            Player("Kurri",   "EDM", 37, 53),
            Player("Yzerman", "DET", 42, 56),
            Player("Gretzky", "EDM", 35, 89)
        ]

class TestStatisticsService(unittest.TestCase):
    def setUp(self):
        # annetaan StatisticsService-luokan oliolle "stub"-luokan olio
        self.stats = StatisticsService(
            PlayerReaderStub()
        )
        
        self.edmonton_players = self.stats.team("EDM")
        self.detroit_players = self.stats.team("DET")
        self.pittsburgh_players = self.stats.team("PIT")        
        self.top_scorer = self.stats.top(1)
        
    def test_Gretzky(self):
        # Gretzky EDM 35 + 89 = 124
        self.assertEqual(str(self.stats.search("Gretzky")), "Gretzky EDM 35 + 89 = 124")
        
    def test_Selanne(self):
        self.assertIsNone(self.stats.search("Selanne"))
        
    def test_edmonton_players(self):
        self.assertEqual(len(self.edmonton_players), 3)

    def test_top_scorer(self):
        self.assertEqual(str(self.top_scorer[0]), "Gretzky EDM 35 + 89 = 124")
    
