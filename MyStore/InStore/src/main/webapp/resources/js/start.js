/**
 * Created by alex1_000 on 21.11.2016.
 */

document.addEventListener('DOMContentLoaded', function() {
    var interval = setInterval(function() {
        var switchers = document.querySelectorAll('.slider input[type="radio"]');

        var activeSwitcherIndex = [].reduce.call(switchers, function(index, switcher, i) {
            if (switcher.checked) {
                index = i;
            }

            return index;
        }, -1);

        activeSwitcherIndex = (activeSwitcherIndex + 1) % switchers.length;

        [].forEach.call(switchers, function(switcher, i) {
            if (i == activeSwitcherIndex) {
                switcher.checked = true;
            }
            else {
                switcher.checked = false;
            }
        });
    }, 5000);
});
