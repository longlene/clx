# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides an oembed liquid tag for Jekyll"
HOMEPAGE="https://github.com/stereobooster/jekyll_oembed"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-0"
ruby_add_rdepend "=dev-ruby/ruby-oembed-0.8.8"
ruby_add_rdepend ">=dev-ruby/rake-0"

