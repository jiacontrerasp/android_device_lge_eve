/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <unistd.h>
#include <linux/input.h>

#include "recovery_ui.h"
#include "common.h"
#include "extendedcommands.h"

char* MENU_HEADERS[] = { "Use volume to highlight;",
                         "camera to select.",
                         "",
                         NULL };

char* MENU_ITEMS[] = { "reboot system now [Home+Back]",
                       "apply sdcard:update.zip",
                       "wipe data/factory reset",
                       "wipe cache partition",
                       "install zip from sdcard",
                       "backup and restore",
                       "mounts and storage",
                       "advanced",
                       "power off",
                       NULL };

int device_recovery_start() {
    return 0;
}

int device_toggle_display(volatile char* key_pressed, int key_code) {
    //return key_pressed[KEY_HOME] && key_code == KEY_END;
    // allow toggling of the display if the correct key is pressed, and the display toggle is allowed or the display is currently off
    if (ui_get_showing_back_button()) {
        return 0;
        //return get_allow_toggle_display() && (key_code == KEY_HOME || key_code == KEY_MENU || key_code == KEY_END);
    }
    return get_allow_toggle_display() && (key_code == KEY_HOME || key_code == KEY_MENU || key_code == KEY_POWER || key_code == KEY_END);
}

int device_reboot_now(volatile char* key_pressed, int key_code) {
    return key_pressed[KEY_MENU] &&   // menu
           key_pressed[KEY_SEND] &&   // green
           key_code == KEY_END;       // red
}

int device_handle_key(int key, int visible) {
    if (key == KEY_BACK && ui_key_pressed(KEY_HOME)) {
        // Wait for the keys to be released, to avoid triggering
        // special boot modes (like coming back into recovery!).
        while (ui_key_pressed(KEY_BACK) ||
               ui_key_pressed(KEY_HOME)) {
            usleep(1000);
        }
        return ITEM_REBOOT;
    } else if (visible) {
        switch (key) {
            case KEY_DOWN:
            case KEY_RIGHT:
            case KEY_VOLUMEDOWN:
                return HIGHLIGHT_DOWN;

            case KEY_UP:
            case KEY_LEFT:
            case KEY_VOLUMEUP:
                return HIGHLIGHT_UP;

            case KEY_POWER:
                if (ui_get_showing_back_button()) {
                    return SELECT_ITEM;
                }
                if (!get_allow_toggle_display())
                    return GO_BACK;
                break;

            case KEY_MENU:
            case KEY_ENTER:
            case KEY_CAMERA:
            case /* KEY_FOCUS */ 242:
                return SELECT_ITEM;

            case KEY_END:
            case KEY_BACKSPACE:
            case KEY_BACK:
                if (ui_get_showing_back_button()) {
                    return SELECT_ITEM;
                }
                if (!get_allow_toggle_display())
                    return GO_BACK;
        }
    }

    return NO_ACTION;
}

int device_perform_action(int which) {
    return which;
}

int device_wipe_data() {
    return 0;
}
