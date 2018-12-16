# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A library for defining a set of conditions, matching them against an input, and finally return an outcome"
HOMEPAGE="http://moove-it.github.io/ruy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/tzinfo-1"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend "=dev-ruby/simplecov-0.10.0"

