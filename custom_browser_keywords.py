# custom_browser_keywords.py
from selenium import webdriver

def get_chrome_options_for_detach():
    options = webdriver.ChromeOptions()
    options.add_experimental_option("detach", True)
    # คุณสามารถเพิ่ม options อื่นๆ ได้ที่นี่ เช่น
    # options.add_argument("--headless") # รันแบบ headless browser
    options.add_argument("--incognito") # รันแบบ Incognito mode
    return options