import { Bar } from "./modules/bar/bar.js"
import { NotificationPopups } from "./modules/popups/notifications.js"
import { applauncher } from "./modules/applauncher/applauncher.js"
import { Media } from "./modules/widgets/media/media.js"

// TEST Notifications
Utils.timeout(100, () => Utils.notify({
    summary: "Notification Popup Example",
    iconName: "info-symbolic",
    body: "Lorem ipsum dolor sit amet, qui minim labore adipisicing "
        + "minim sint cillum sint consectetur cupidatat.",
    actions: {
        "Cool": () => print("pressed Cool"),
    },
}))

// TEST
const win = Widget.Window({
    name: "mpris",
    anchor: ["top", "right"],
    child: Media(),
})

App.config({
    style: "./index.css",
    windows: [
        Bar(),
        NotificationPopups(),
        applauncher,
        win,
    ],
})
export { }
