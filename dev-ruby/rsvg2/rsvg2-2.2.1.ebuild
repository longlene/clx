# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby/RSVG is a Ruby binding of librsvg-2"
HOMEPAGE="http://ruby-gnome2.sourceforge.jp/"

LICENSE="LGPLv2.1 or later"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cairo-1.12.8"
ruby_add_rdepend ">=dev-ruby/ruby-gdkpixbuf2-2.2.1"

