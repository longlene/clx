# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A World Wide Web Application Framework"
HOMEPAGE="http://github.com/jugyo/www"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.2.1"
ruby_add_rdepend ">=dev-ruby/tilt-1.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.0.0"

