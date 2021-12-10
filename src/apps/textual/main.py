from textual.app import App
from textual.widgets import Placeholder

class SimpleApp(App):

    async def on_mount(self) -> None:
        await self.view.dock(Placeholder(), edge="left", size=40)
        await self.view.dock(Placeholder(), Placeholder(), edge="top")

# TODO: add examples of using Python decorators
if __name__ == "__main__":
    SimpleApp.run()