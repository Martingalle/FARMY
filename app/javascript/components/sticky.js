function stickyNavigation() {
  const sticky = document.getElementById('navigation');
  if (sticky) {
    let scrollpos = window.scrollY
    const header = document.getElementById('navigation');
    const masternav = document.getElementById('headnav');
    const header_height = 400;
    const add_class_on_scroll = () => header.classList.add("fade-in");
    const add_class_on_scroll_master = () => masternav.classList.add("stick");
    const remove_class_on_scroll = () => header.classList.remove("fade-in");
    const remove_class_on_scroll_master = () => masternav.classList.remove("stick");
    window.addEventListener('scroll', function() {
      scrollpos = window.scrollY;
      if (scrollpos >= header_height) { add_class_on_scroll(); add_class_on_scroll_master()  }
      else { remove_class_on_scroll(); remove_class_on_scroll_master() }
      console.log(scrollpos)
    });
  }
}

export { stickyNavigation };
