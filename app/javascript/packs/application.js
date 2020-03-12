require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import { initSortable } from '../plugins/init_sortable';
import { initSelect2 } from '../plugins/init_select2';
initSelect2();
initSortable();



