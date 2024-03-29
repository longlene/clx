# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A library designed to retrieve and parse feeds as quickly as possible"
HOMEPAGE="http://feedjira.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sax-machine-0.2.1"
ruby_add_rdepend ">=dev-ruby/curb-0.8.1"
ruby_add_rdepend ">=dev-ruby/loofah-2.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14.0"

