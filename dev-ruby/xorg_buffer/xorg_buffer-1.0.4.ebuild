# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    This library is called xorg_buffer
"
HOMEPAGE="http://rubygems.org/gems/xorg_buffer"

LICENSE="GPL 2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""


