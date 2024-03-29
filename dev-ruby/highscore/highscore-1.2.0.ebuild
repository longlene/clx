# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Find and rank keywords in text"
HOMEPAGE="http://domnikl.github.com/highscore"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/simplecov-0.6.4"
ruby_add_rdepend ">=dev-ruby/whatlanguage-1.0.0"
ruby_add_rdepend ">=dev-ruby/bloomfilter-rb-2.1.1"

