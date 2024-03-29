# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby/GObjectIntrospection is a Ruby binding of GObjectIntrospection"
HOMEPAGE="http://ruby-gnome2.sourceforge.jp/"

LICENSE="LGPLv2.1 or later"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/glib2-2.2.3"
ruby_add_rdepend ">=dev-ruby/test-unit-2"

