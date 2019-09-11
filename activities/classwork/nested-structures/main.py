import logging
import json
import fire

from model.industry import SIC
from difflib import SequenceMatcher


URL = "https://www.osha.gov/pls/imis/sic_manual.html"
INDUSTRY_FILE = "industries.json"


class Main(object):

    @staticmethod
    def download(filename=INDUSTRY_FILE):
        pass

    @staticmethod
    def similarity(a, b, exact=False, threshold=0.5):
        pass

    def search(self, title, exact=False, filename=INDUSTRY_FILE):
        pass


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    fire.Fire(Main)
