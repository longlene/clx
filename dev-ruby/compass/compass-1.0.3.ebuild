# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Compass is a Sass-based Stylesheet Framework that streamlines the creation and maintenance of CSS"
HOMEPAGE="http://compass-style.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.3.13"
ruby_add_rdepend ">=dev-ruby/compass-core-1.0.2"
ruby_add_rdepend ">=dev-ruby/compass-import-once-1.0.5"
ruby_add_rdepend ">=dev-ruby/chunky_png-1.2"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0.9.3"
ruby_add_rdepend ">=dev-ruby/rb-inotify-0.9"

